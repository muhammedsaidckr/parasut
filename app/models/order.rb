class Order < ApplicationRecord
  validates :currency_type, presence: true
  validates :gross_amount, presence: true, numericality: { :greater_than => 0 }
  validates :discount_amount, allow_nil: true,  numericality: true, comparison: { less_than: :gross_amount, greater_than_or_equal_to: 0 }

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
      self.discount_amount = 0.0
      self.net_amount = self.gross_amount
    end
  end
end
