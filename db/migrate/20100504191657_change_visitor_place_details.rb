class ChangeVisitorPlaceDetails < ActiveRecord::Migration
  def self.up
	drop_table :visitors
    create_table :visitors do |t|
	t.string :city
	t.string :country
	t.string :ip
	t.datetime :vtime
	t.date :vdate
    end
  end

  def self.down
	drop_table :visitors
  end
end
