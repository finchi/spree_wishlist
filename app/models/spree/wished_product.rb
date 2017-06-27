class Spree::WishedProduct < ActiveRecord::Base
  belongs_to :variant
  belongs_to :wishlist

  validates :variant, presence: true

  extend Spree::DisplayMoney
  money_methods :single, :total

  def single
      variant.price
  end

  def total
      quantity * variant.price
  end
end
