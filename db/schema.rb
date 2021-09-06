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

ActiveRecord::Schema.define(version: 2021_09_05_214316) do

  create_table "account_transactions", force: :cascade do |t|
    t.string "transaction_number"
    t.integer "account_id", null: false
    t.decimal "amount"
    t.string "transaction_type"
    t.string "description"
    t.integer "transfer_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_id"], name: "index_account_transactions_on_account_id"
    t.index ["transfer_id"], name: "index_account_transactions_on_transfer_id"
  end

  create_table "accounts", force: :cascade do |t|
    t.integer "client_id", null: false
    t.string "account_number"
    t.decimal "balance"
    t.string "currency"
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["client_id"], name: "index_accounts_on_client_id"
  end

  create_table "clients", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "phone_number"
    t.string "address"
    t.string "city"
    t.string "country"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "transfers", force: :cascade do |t|
    t.integer "transferor_id"
    t.integer "transferee_id"
    t.date "execution_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["transferee_id"], name: "index_transfers_on_transferee_id"
    t.index ["transferor_id"], name: "index_transfers_on_transferor_id"
  end

  add_foreign_key "account_transactions", "accounts"
  add_foreign_key "account_transactions", "transfers"
  add_foreign_key "accounts", "clients"
  add_foreign_key "transfers", "accounts", column: "transferee_id"
  add_foreign_key "transfers", "accounts", column: "transferor_id"
end
