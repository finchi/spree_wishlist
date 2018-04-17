class Spree::WishedProduct < ActiveRecord::Base
  if Gem.loaded_specs['spree_core'].version >= Gem::Version.create('3.3.0')
      belongs_to :variant, optional: true
      belongs_to :wishlist, optional: true
    else
      belongs_to :variant
      belongs_to :wishlist
  end

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
