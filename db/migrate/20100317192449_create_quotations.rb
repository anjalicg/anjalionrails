class CreateQuotations < ActiveRecord::Migration
  def self.up
    create_table :quotations do |t|
	t.column :quote, :text, :null=>false
	t.column :author, :string 
	t.column :created_at, :timestamp
    end
  end

  def self.down
    drop_table :quotations
  end
end
