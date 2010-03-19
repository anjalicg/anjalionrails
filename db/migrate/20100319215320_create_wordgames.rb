class CreateWordgames < ActiveRecord::Migration
  def self.up
    create_table :wordgames do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :wordgames
  end
end
