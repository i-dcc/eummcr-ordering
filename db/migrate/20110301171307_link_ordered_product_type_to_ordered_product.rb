class LinkOrderedProductTypeToOrderedProduct < ActiveRecord::Migration
  def self.up
    remove_column :ordered_products, :product
    add_column :ordered_products, :ordered_product_type_id, :integer, :null => false
    add_foreign_key( :ordered_products, :ordered_product_types )
  end

  def self.down
    remove_foreign_key( :ordered_products, :ordered_product_types )
    remove_column :ordered_products, :ordered_product_type_id
    add_column :ordered_products, :product, :string, :null => false
  end
end