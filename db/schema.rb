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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20151220094551) do

  create_table "authors", force: :cascade do |t|
    t.string   "name",         null: false
    t.string   "organization"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "bills", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "copy_id"
    t.date     "reserve_time"
    t.date     "due_time"
    t.date     "take_date"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "bills", ["copy_id"], name: "index_bills_on_copy_id"
  add_index "bills", ["user_id"], name: "index_bills_on_user_id"

  create_table "book_publishers", force: :cascade do |t|
    t.integer  "book_id"
    t.integer  "publisher_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "book_publishers", ["book_id"], name: "index_book_publishers_on_book_id"
  add_index "book_publishers", ["publisher_id"], name: "index_book_publishers_on_publisher_id"

  create_table "books", force: :cascade do |t|
    t.string   "isbn",        null: false
    t.string   "title",       null: false
    t.date     "year",        null: false
    t.integer  "copy_number", null: false
    t.string   "category"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "books_authors", force: :cascade do |t|
    t.integer  "book_id"
    t.integer  "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "books_authors", ["author_id"], name: "index_books_authors_on_author_id"
  add_index "books_authors", ["book_id"], name: "index_books_authors_on_book_id"

  create_table "copies", force: :cascade do |t|
    t.integer  "book_id",    null: false
    t.date     "enter_time", null: false
    t.integer  "state",      null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "publishers", force: :cascade do |t|
    t.string   "name",       null: false
    t.string   "address",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "receipts", force: :cascade do |t|
    t.integer  "user_id",       null: false
    t.integer  "copy_id",       null: false
    t.date     "lent_out_date"
    t.date     "due_date"
    t.date     "back_date"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "receipts", ["copy_id"], name: "index_receipts_on_copy_id"
  add_index "receipts", ["user_id"], name: "index_receipts_on_user_id"

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], name: "index_roles_on_name"

  create_table "searches", force: :cascade do |t|
    t.string   "keyword"
    t.string   "authors"
    t.integer  "publisher_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"

end
