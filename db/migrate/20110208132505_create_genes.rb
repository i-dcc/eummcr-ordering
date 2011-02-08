class CreateGenes < ActiveRecord::Migration
  def self.up
    create_table :genes do |t|
      t.string :symbol, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :genes
  end
end
