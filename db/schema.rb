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

ActiveRecord::Schema.define(version: 20170726042556) do

  create_table "books", force: :cascade do |t|
    t.integer "seller_id"
    t.string "name"
    t.float "seller_price"
    t.float "user_price"
    t.integer "qunatity_in_stock"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["seller_id"], name: "index_books_on_seller_id"
  end

  create_table "carts", force: :cascade do |t|
    t.integer "user_id"
    t.integer "books_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "seller_id"
    t.float "user_price"
    t.float "seller_price"
    t.integer "status", default: 0
    t.index ["user_id"], name: "index_carts_on_user_id"
  end

  create_table "course_makers", force: :cascade do |t|
    t.integer "course_id"
    t.integer "pg_no"
    t.string "pg_name"
    t.text "section1"
    t.text "section2"
    t.text "section3"
    t.text "section4"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_course_makers_on_course_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "name"
    t.integer "teacher_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "status", default: 0
    t.index ["teacher_id"], name: "index_courses_on_teacher_id"
  end

  create_table "quoras", force: :cascade do |t|
    t.string "content"
    t.integer "question_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
  end

  create_table "seller_orders", force: :cascade do |t|
    t.integer "seller_id"
    t.integer "product_id"
    t.integer "qunatity"
    t.float "seller_price_per_unit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["seller_id"], name: "index_seller_orders_on_seller_id"
  end

  create_table "seller_profiles", force: :cascade do |t|
    t.integer "seller_id"
    t.string "name"
    t.string "address"
    t.float "credit"
    t.float "debit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["seller_id"], name: "index_seller_profiles_on_seller_id"
  end

  create_table "sellers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_sellers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_sellers_on_reset_password_token", unique: true
  end

  create_table "teachers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_teachers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_teachers_on_reset_password_token", unique: true
  end

  create_table "user_orders", force: :cascade do |t|
    t.integer "user_id"
    t.integer "product_id"
    t.integer "quantity"
    t.float "user_price_per_unit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_orders_on_user_id"
  end

  create_table "user_profiles", force: :cascade do |t|
    t.integer "user_id"
    t.string "name"
    t.string "address"
    t.float "credit"
    t.float "debit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_profiles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
