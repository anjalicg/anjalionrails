class CreateVisitors < ActiveRecord::Migration
  def self.up
    create_table :visitors do |t|
	t.string :place
	t.string :ip
	t.datetime :vtime
	t.date :vdate
    end
  end

  def self.down
    drop_table :visitors
  end
end
