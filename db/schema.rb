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

ActiveRecord::Schema.define(:version => 20091009064620) do

  create_table "albums", :force => true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "description"
  end

  create_table "contacts", :force => true do |t|
    t.string   "some_contact"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "downloads", :force => true do |t|
    t.string   "title_whole_music"
    t.string   "title_cut_music"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lyrics", :force => true do |t|
    t.string   "title"
    t.text     "text_song"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "album_id"
  end

  create_table "messages", :force => true do |t|
    t.string   "your_name"
    t.string   "your_email"
    t.string   "your_message"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "order_transactions", :force => true do |t|
    t.integer  "order_id"
    t.integer  "amount"
    t.boolean  "success"
    t.string   "reference"
    t.string   "message"
    t.string   "action"
    t.text     "params"
    t.boolean  "test"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", :force => true do |t|
    t.string   "description"
    t.integer  "amount"
    t.string   "state",       :default => "pending"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "participants", :force => true do |t|
    t.string   "name"
    t.text     "bio"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts", :force => true do |t|
    t.string   "title"
    t.datetime "date"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reviews", :force => true do |t|
    t.string   "title"
    t.datetime "date"
    t.string   "author"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "uploads", :force => true do |t|
    t.string   "name"
    t.integer  "music_file_size"
    t.string   "music_file_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "music_content_type"
    t.datetime "music_updated_at"
    t.string   "file_file_name"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
    t.string   "file_content_type"
    t.string   "title"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "hashed_password"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
