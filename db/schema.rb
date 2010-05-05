# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100504191657) do

  create_table "hangmen", :force => true do |t|
    t.string "word"
    t.string "category"
  end

  create_table "quotations", :force => true do |t|
    t.text     "quote",      :null => false
    t.string   "author"
    t.datetime "created_at"
  end

  create_table "visitors", :force => true do |t|
    t.string   "city"
    t.string   "country"
    t.string   "ip"
    t.datetime "vtime"
    t.date     "vdate"
  end

  create_table "vocabs", :force => true do |t|
    t.string  "word"
    t.string  "opt1"
    t.string  "opt2"
    t.string  "opt3"
    t.string  "opt4"
    t.string  "ans"
    t.integer "attempt", :default => 0
    t.integer "correct", :default => 0
  end

  create_table "wordjumbles", :force => true do |t|
    t.string  "word"
    t.integer "difficulty"
  end

end
