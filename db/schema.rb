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

ActiveRecord::Schema.define(version: 20170330122144) do

  create_table "acts_as_bookable_bookings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "bookable_type"
    t.integer  "bookable_id"
    t.string   "booker_type"
    t.integer  "booker_id"
    t.integer  "amount"
    t.text     "schedule",      limit: 65535
    t.datetime "time_start"
    t.datetime "time_end"
    t.datetime "time"
    t.datetime "created_at"
    t.index ["bookable_type", "bookable_id"], name: "index_acts_as_bookable_bookings_bookable", using: :btree
    t.index ["booker_type", "booker_id"], name: "index_acts_as_bookable_bookings_booker", using: :btree
  end

  create_table "comments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text     "text",         limit: 65535
    t.integer  "fabmoment_id"
    t.integer  "author_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["author_id"], name: "index_comments_on_author_id", using: :btree
    t.index ["fabmoment_id"], name: "index_comments_on_fabmoment_id", using: :btree
  end

  create_table "fabmoments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "title"
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "author_id"
    t.integer  "license_id"
    t.string   "source"
    t.index ["author_id"], name: "index_fabmoments_on_author_id", using: :btree
    t.index ["license_id"], name: "index_fabmoments_on_license_id", using: :btree
  end

  create_table "fabmoments_tags", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "tag_id",       null: false
    t.integer "fabmoment_id", null: false
    t.index ["fabmoment_id", "tag_id"], name: "index_fabmoments_tags_on_fabmoment_id_and_tag_id", using: :btree
    t.index ["tag_id", "fabmoment_id"], name: "index_fabmoments_tags_on_tag_id_and_fabmoment_id", using: :btree
  end

  create_table "feeds", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "fabmoment_id"
    t.integer  "material_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["fabmoment_id"], name: "index_feeds_on_fabmoment_id", using: :btree
    t.index ["material_id"], name: "index_feeds_on_material_id", using: :btree
  end

  create_table "handles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "fabmoment_id"
    t.integer  "machine_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["fabmoment_id"], name: "index_handles_on_fabmoment_id", using: :btree
    t.index ["machine_id"], name: "index_handles_on_machine_id", using: :btree
  end

  create_table "interfaces", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "fabmoment_id"
    t.integer  "program_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["fabmoment_id"], name: "index_interfaces_on_fabmoment_id", using: :btree
    t.index ["program_id"], name: "index_interfaces_on_program_id", using: :btree
  end

  create_table "licenses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "title"
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "machines", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.text     "schedule",   limit: 65535
    t.integer  "capacity"
  end

  create_table "materials", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "sort"
    t.string   "name"
    t.integer  "thickness"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "meetings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "rails"
    t.string   "g"
    t.string   "scaffold"
    t.string   "Meeting"
    t.string   "name"
    t.datetime "start_time"
    t.datetime "end_time"
    t.string   "calendar"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pictures", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "imageable_type"
    t.integer  "imageable_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.index ["imageable_type", "imageable_id"], name: "index_pictures_on_imageable_type_and_imageable_id", using: :btree
  end

  create_table "programs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "project_files", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.integer  "fabmoment_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
    t.index ["fabmoment_id"], name: "index_project_files_on_fabmoment_id", using: :btree
  end

  create_table "rentings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "reservations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text     "description", limit: 65535
    t.datetime "begin_time"
    t.datetime "end_time"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "tags", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "admin",                  default: false
    t.datetime "archived_at"
    t.string   "username"
    t.string   "adress"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "comments", "fabmoments"
  add_foreign_key "comments", "users", column: "author_id"
  add_foreign_key "fabmoments", "licenses"
  add_foreign_key "fabmoments", "users", column: "author_id"
end
