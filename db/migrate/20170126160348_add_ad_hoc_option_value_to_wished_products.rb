class AddAdHocOptionValueToWishedProducts < ActiveRecord::Migration
  def change
    add_column :spree_wished_products, :ad_hoc_option_value_id, :integer
  end
end