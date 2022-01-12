class Order < ApplicationRecord
  validates :currency_type, presence: true
  validates :gross_amount, presence: true, numericality: true
  validates :discount_amount, allow_nil: true,  numericality: true, comparison: { less_than: :gross_amount }

  belongs_to :category, class_name: "Category", optional: true
  enum currency_type: {
    TL: 0,
    USD: 1,
    EUR: 2
  }

  before_save do
    if self.discount_amount
      self.net_amount = self.gross_amount - self.discount_amount
    else
      self.net_amount = self.gross_amount
    end
  end
end
