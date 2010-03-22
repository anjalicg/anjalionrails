class ChangeVocabAns < ActiveRecord::Migration
  def self.up
	change_table :vocabs do |t|
	t.change :ans , :string
	end
  
  end

  def self.down
  end
end
