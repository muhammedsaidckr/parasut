class Order < ApplicationRecord
  validates :currency_type, presence: true
  validates :gross_amount, presence: true, numericality: true, comparison: { greater_than: :discount_amount }
  validates :discount_amount, numericality: true

  belongs_to :category, class_name: "Category", optional: true
  enum currency_type: {
    TL: 0,
    USD: 1,
    EUR: 2
  }

  before_create do
    self.net_amount = self.gross_amount - self.discount_amount
  end
end
