class CreateHangmen < ActiveRecord::Migration
  def self.up
    create_table :hangmen do |t|
	t.string :word
	t.string :category
    end
    Hangman.create (:word=>'INDIA', :category=>'Countries')
    Hangman.create (:word=>'JAPAN', :category=>'Countries')
    Hangman.create (:word=>'CHINA', :category=>'Countries')
    Hangman.create (:word=>'NORWAY', :category=>'Countries')
    Hangman.create (:word=>'Peril at End House', :category=>'Agatha Christie Novels')
    Hangman.create (:word=>'The Secret of Chimneys', :category=>'Agatha Christie Novels')
    Hangman.create (:word=>'The Mystery of the Blue Train', :category=>'Agatha Christie Novels')
    Hangman.create (:word=>'The Murder at the Vicarage', :category=>'Agatha Christie Novels')
    Hangman.create (:word=>'Murder in Mesopotamia', :category=>'Agatha Christie Novels')
    Hangman.create (:word=>'Death on the Nile', :category=>'Agatha Christie Novels')
  end

  def self.down
    drop_table :hangmen
  end
end
