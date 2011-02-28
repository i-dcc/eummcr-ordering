class CreateOrderedProducts < ActiveRecord::Migration
  def self.up
    create_table :ordered_products do |t|
      t.references :order
      t.references :gene
      t.string :product,                :null => false
      t.boolean :genotyping,            :default => false
      t.boolean :extra_vial_per_clone,  :default => false
      t.boolean :allele_qc,             :default => false
      t.boolean :karyotyping,           :default => false
      t.boolean :replacement_vials,     :default => false
      t.timestamps
    end
    
    add_foreign_key( :ordered_products, :orders )
    add_foreign_key( :ordered_products, :genes )
  end

  def self.down
    remove_foreign_key( :ordered_products, :orders )
    remove_foreign_key( :ordered_products, :genes )
    
    drop_table :ordered_products
  end
end
