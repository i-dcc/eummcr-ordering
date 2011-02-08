class CreateClones < ActiveRecord::Migration
  def self.up
    create_table :clones do |t|
      t.string :name, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :clones
  end
end
