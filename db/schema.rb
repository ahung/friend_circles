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

ActiveRecord::Schema.define(:version => 20131217194346) do

  create_table "friend_circle_memberships", :force => true do |t|
    t.integer  "friend_circle_id"
    t.integer  "user_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "friend_circle_memberships", ["friend_circle_id"], :name => "index_friend_circle_memberships_on_friend_circle_id"
  add_index "friend_circle_memberships", ["user_id"], :name => "index_friend_circle_memberships_on_user_id"

  create_table "friend_circles", :force => true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "friend_circles", ["user_id"], :name => "index_friend_circles_on_user_id"

  create_table "links", :force => true do |t|
    t.string   "title"
    t.string   "url"
    t.integer  "post_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "links", ["post_id"], :name => "index_links_on_post_id"

  create_table "post_shares", :force => true do |t|
    t.integer  "post_id"
    t.integer  "friend_circle_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "post_shares", ["friend_circle_id"], :name => "index_post_shares_on_friend_circle_id"
  add_index "post_shares", ["post_id"], :name => "index_post_shares_on_post_id"

  create_table "posts", :force => true do |t|
    t.string   "title"
    t.string   "body"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "posts", ["user_id"], :name => "index_posts_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.string   "session_token"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "pw_reset_token"
  end

  add_index "users", ["session_token"], :name => "index_users_on_session_token"

end
