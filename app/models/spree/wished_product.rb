class Spree::WishedProduct < ActiveRecord::Base
  belongs_to :variant
  belongs_to :wishlist
  belongs_to :ad_hoc_option_value

  validates :variant, presence: true

  extend Spree::DisplayMoney
  money_methods :single, :total

  def single
    if ad_hoc_option_value.present?
      variant.price + ad_hoc_option_value.price_modifier
    else
      variant.price
    end
  end

  def total
    if ad_hoc_option_value.present?
      quantity * (variant.price + ad_hoc_option_value.price_modifier)
    else
      quantity * variant.price
    end
  end
end
