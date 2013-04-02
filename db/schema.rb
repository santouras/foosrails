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

ActiveRecord::Schema.define(:version => 20130129105836) do

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.float    "points"
    t.string   "password_digest"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "remember_token"
    t.index ["email"], :name => "index_users_on_email", :unique => true
    t.index ["remember_token"], :name => "index_users_on_remember_token"
  end

  create_table "games", :force => true do |t|
    t.integer  "user1_id"
    t.integer  "user2_id"
    t.integer  "score1"
    t.integer  "score2"
    t.float    "points"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.index ["user1_id"], :name => "index_games_on_user1_id"
    t.index ["user2_id"], :name => "index_games_on_user2_id"
    t.foreign_key ["user1_id"], "users", ["id"], :on_update => :restrict, :on_delete => :restrict, :name => "fk_games_user1_id"
    t.foreign_key ["user2_id"], "users", ["id"], :on_update => :restrict, :on_delete => :restrict, :name => "fk_games_user2_id"
  end

end
