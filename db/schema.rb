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

ActiveRecord::Schema.define(version: 20160829111712) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.text     "text"
    t.integer  "fabmoment_id"
    t.integer  "author_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["author_id"], name: "index_comments_on_author_id", using: :btree
    t.index ["fabmoment_id"], name: "index_comments_on_fabmoment_id", using: :btree
  end

  create_table "fabmoments", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "author_id"
    t.json     "images"
    t.json     "project_files"
    t.index ["author_id"], name: "index_fabmoments_on_author_id", using: :btree
  end

  create_table "fabmoments_tags", id: false, force: :cascade do |t|
    t.integer "tag_id",       null: false
    t.integer "fabmoment_id", null: false
    t.index ["fabmoment_id", "tag_id"], name: "index_fabmoments_tags_on_fabmoment_id_and_tag_id", using: :btree
    t.index ["tag_id", "fabmoment_id"], name: "index_fabmoments_tags_on_tag_id_and_fabmoment_id", using: :btree
  end

  create_table "feeds", force: :cascade do |t|
    t.integer  "fabmoment_id"
    t.integer  "material_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["fabmoment_id"], name: "index_feeds_on_fabmoment_id", using: :btree
    t.index ["material_id"], name: "index_feeds_on_material_id", using: :btree
  end

  create_table "handles", force: :cascade do |t|
    t.integer  "fabmoment_id"
    t.integer  "machine_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["fabmoment_id"], name: "index_handles_on_fabmoment_id", using: :btree
    t.index ["machine_id"], name: "index_handles_on_machine_id", using: :btree
  end

  create_table "interfaces", force: :cascade do |t|
    t.integer  "fabmoment_id"
    t.integer  "program_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["fabmoment_id"], name: "index_interfaces_on_fabmoment_id", using: :btree
    t.index ["program_id"], name: "index_interfaces_on_program_id", using: :btree
  end

  create_table "machines", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "materials", force: :cascade do |t|
    t.string   "sort"
    t.string   "name"
    t.integer  "thickness"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "programs", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "admin",                  default: false
    t.datetime "archived_at"
    t.string   "avatar"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "comments", "fabmoments"
  add_foreign_key "comments", "users", column: "author_id"
  add_foreign_key "fabmoments", "users", column: "author_id"
end
