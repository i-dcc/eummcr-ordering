class CreateSettings < ActiveRecord::Migration
  def self.up
    create_table :settings do |t|
      t.string :key, :null => false
      t.string :value, :null => false

      t.timestamps
    end
    
    add_index :settings, [:key, :value], :unique => true
  end

  def self.down
    remove_index :settings, :column => [:key, :value]
    drop_table :settings
  end
end