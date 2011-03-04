class CreateOrderedProducts < ActiveRecord::Migration
  def self.up
    create_table :ordered_products do |t|
      t.references :order
      t.string     :gene,                  :null => false
      t.string     :product,               :null => false
      t.boolean    :genotyping,            :default => false
      t.boolean    :extra_vial_per_clone,  :default => false
      t.boolean    :allele_qc,             :default => false
      t.boolean    :karyotyping,           :default => false
      t.boolean    :replacement_vials,     :default => false
      t.decimal    :price,                 :null => false
      t.timestamps
    end
    
    add_foreign_key( :ordered_products, :orders )
  end

  def self.down
    remove_foreign_key( :ordered_products, :orders )
    
    drop_table :ordered_products
  end
end
