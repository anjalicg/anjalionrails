class CreateWordjumbles < ActiveRecord::Migration
  def self.up
    create_table :wordjumbles do |t|
	t.column :word, :string
	t.column :difficulty, :integer
    end
  Wordjumble.create(:word=>'test',:difficulty=>1)
  Wordjumble.create(:word=>'moon',:difficulty=>2)
  Wordjumble.create(:word=>'jupiter',:difficulty=>3)
  Wordjumble.create(:word=>'India',:difficulty=>4)
  Wordjumble.create(:word=>'Suresh',:difficulty=>5)
  end

  def self.down
    drop_table :wordjumbles
  end
end
