# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_02_20_210933) do
  create_table "calculations", force: :cascade do |t|
    t.date "date", null: false
    t.decimal "net_profit_loss", precision: 10, scale: 2, null: false
    t.decimal "revenue", precision: 10, scale: 2, null: false
    t.decimal "expenses", precision: 10, scale: 2, null: false
    t.decimal "sales", precision: 10, scale: 2, null: false
    t.decimal "accounts_receivable", precision: 10, scale: 2, null: false
    t.decimal "accounts_payable", precision: 10, scale: 2, null: false
    t.integer "profit_loss_statement_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["profit_loss_statement_id"], name: "index_calculations_on_profit_loss_statement_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "product_id", null: false
    t.integer "quantity"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_orders_on_product_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "profit_loss_statements", force: :cascade do |t|
    t.datetime "date"
    t.string "name"
    t.decimal "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "revenue"
    t.decimal "expenses"
    t.decimal "sales"
    t.decimal "accounts_receivable"
    t.decimal "accounts_payable"
  end

  create_table "trial_balances", force: :cascade do |t|
    t.datetime "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "calculations", "profit_loss_statements"
  add_foreign_key "orders", "products"
  add_foreign_key "orders", "users"
end
