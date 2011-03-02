class CreateOrderedProductTypes < ActiveRecord::Migration
  def self.up
    create_table :ordered_product_types do |t|
      t.string :product_type

      t.timestamps
    end
    
    add_index :ordered_product_types, [:product_type], :unique => true
  end

  def self.down
    remove_index :ordered_product_types, :column => [:product_type]
    drop_table :ordered_product_types
  end
end