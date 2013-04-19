# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130418095346) do

  create_table "questions", :force => true do |t|
    t.integer  "stream_id"
    t.integer  "user_id"
    t.string   "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "relationships", :force => true do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "relationships", ["followed_id"], :name => "index_relationships_on_followed_id"
  add_index "relationships", ["follower_id", "followed_id"], :name => "index_relationships_on_follower_id_and_followed_id", :unique => true
  add_index "relationships", ["follower_id"], :name => "index_relationships_on_follower_id"

  create_table "replies", :force => true do |t|
    t.integer  "ques_id"
    t.integer  "user_id"
    t.string   "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "stream_users", :force => true do |t|
    t.integer  "user_id"
    t.integer  "stream_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "stream_users", ["stream_id"], :name => "index_stream_users_on_stream_id"
  add_index "stream_users", ["user_id", "stream_id"], :name => "index_stream_users_on_user_id_and_stream_id", :unique => true
  add_index "stream_users", ["user_id"], :name => "index_stream_users_on_user_id"

  create_table "streams", :force => true do |t|
    t.integer  "stream_id"
    t.string   "stream_name"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.string   "stream_table_name"
  end

  add_index "streams", ["stream_id", "stream_name"], :name => "index_streams_on_stream_id_and_stream_name", :unique => true
  add_index "streams", ["stream_id"], :name => "index_streams_on_stream_id", :unique => true
  add_index "streams", ["stream_name"], :name => "index_streams_on_stream_name", :unique => true

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       :limit => 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type", "context"], :name => "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", :force => true do |t|
    t.string "name"
  end

  create_table "user_files", :force => true do |t|
    t.integer  "user_id"
    t.string   "file_name"
    t.string   "file"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.string   "file_description"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.string   "password_digest"
    t.string   "remember_token"
    t.string   "qualification"
    t.string   "designation"
    t.string   "image"
    t.boolean  "admin",           :default => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end
