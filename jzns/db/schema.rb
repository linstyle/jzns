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

ActiveRecord::Schema.define(:version => 20120904032012) do

  create_table "common_event_contents", :force => true do |t|
    t.integer   "event_id"
    t.integer   "user_id",                           :null => false
    t.string    "user_nickname",      :limit => 10,  :null => false
    t.string    "content",            :limit => 140, :null => false
    t.timestamp "insert_time",                       :null => false
    t.string    "photo_file_name"
    t.string    "photo_content_type"
    t.integer   "photo_file_size"
    t.datetime  "photo_updated_at"
  end

  create_table "common_event_follows", :id => false, :force => true do |t|
    t.integer "user_id",  :null => false
    t.integer "event_id", :null => false
  end

  create_table "common_events", :force => true do |t|
    t.string    "title",           :limit => 15,                :null => false
    t.integer   "message_count",                 :default => 0
    t.timestamp "lastupdate_time",                              :null => false
  end

  create_table "person_events", :force => true do |t|
    t.string    "title",           :limit => 15,                :null => false
    t.integer   "messge_count",                  :default => 0
    t.timestamp "lastupdate_time",                              :null => false
  end

  create_table "users", :id => false, :force => true do |t|
    t.integer   "id",                                                               :null => false
    t.string    "name",            :limit => 24,                                    :null => false
    t.string    "password_digest", :limit => 60,                                    :null => false
    t.string    "nick_name",       :limit => 10,                                    :null => false
    t.datetime  "lastlogin_time",                :default => '2012-08-10 00:00:00'
    t.timestamp "reg_time",                                                         :null => false
  end

end
