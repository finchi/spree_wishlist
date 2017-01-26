class Spree::Wishlist < ActiveRecord::Base
  belongs_to :user, class_name: Spree.user_class
  has_many :wished_products, dependent: :destroy
  before_create :set_access_hash

  validates :name, presence: true

  def includes_combination?(variant_id, option_id)
    wished_products.find do |product|
      product.variant_id == variant_id.to_i and product.ad_hoc_option_value_id == option_id.to_i
    end
  end

  def to_param
    access_hash
  end

  def self.get_by_param(param)
    Spree::Wishlist.find_by_access_hash(param)
  end

  def can_be_read_by?(user)
    !is_private? || user == self.user
  end

  def is_default=(value)
    self[:is_default] = value
    return unless is_default?
    Spree::Wishlist.where(is_default: true, user_id: user_id).where.not(id: id).update_all(is_default: false)
  end

  def is_public?
    !is_private?
  end

  private

  def set_access_hash
    random_string = SecureRandom.hex(16)
    self.access_hash = Digest::SHA1.hexdigest("--#{user_id}--#{random_string}--#{Time.now}--")
  end
end
