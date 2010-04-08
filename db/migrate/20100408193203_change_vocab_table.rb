class ChangeVocabTable < ActiveRecord::Migration
  def self.up
	drop_table :vocabs
	create_table :vocabs do |t|
	t.string :word
	t.string :opt1
	t.string :opt2
	t.string :opt3
	t.string :opt4
	t.string :ans
	t.integer :attempt, :default=>0
	t.integer :correct, :default=>0
    end
    Vocab.create(:word=>'marine', :opt1=>'oceanic', :opt2=>'extraordinary', :opt3=>'missionary', :opt4=>'idiotic', :ans=>'oceanic')
    Vocab.create(:word=>'booty', :opt1=>'ornament', :opt2=>'serpent', :opt3=>'plunder', :opt4=>'aggravation', :ans=>'plunder')
    Vocab.create(:word=>'obsession', :opt1=>'prediction', :opt2=>'large rock', :opt3=>'cargo', :opt4=>'fixation', :ans=>'fixation')
    Vocab.create(:word=>'dusk', :opt1=>'twilight', :opt2=>'inducement', :opt3=>'clapping', :opt4=>'rejoicing', :ans=>'twilight')
    Vocab.create(:word=>'liable', :opt1=>'insubstantial', :opt2=>'responsible', :opt3=>'traumatic', :opt4=>'slightly open', :ans=>'responsible')
    Vocab.create(:word=>'recruit', :opt1=>'enlist', :opt2=>'confront', :opt3=>'surmount', :opt4=>'interpret', :ans=>'enlist')
  end

  def self.down
  end
end
