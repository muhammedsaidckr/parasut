class Category < ApplicationRecord
  validates :name, presence:true, uniqueness: true

  before_validation :strip_whitespace

  private
  def strip_whitespace
    self.name = self.name.strip unless self.name.nil?
  end
end
