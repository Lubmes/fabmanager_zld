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

ActiveRecord::Schema.define(version: 20170627142409) do

  create_table "acts_as_bookable_bookings", force: :cascade do |t|
    t.string   "bookable_type"
    t.integer  "bookable_id"
    t.string   "booker_type"
    t.integer  "booker_id"
    t.integer  "amount"
    t.text     "schedule"
    t.datetime "time_start"
    t.datetime "time_end"
    t.datetime "time"
    t.datetime "created_at"
    t.index ["bookable_type", "bookable_id"], name: "index_acts_as_bookable_bookings_bookable"
    t.index ["booker_type", "booker_id"], name: "index_acts_as_bookable_bookings_booker"
  end

  create_table "comments", force: :cascade do |t|
    t.text     "text"
    t.integer  "fabmoment_id"
    t.integer  "author_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["author_id"], name: "index_comments_on_author_id"
    t.index ["fabmoment_id"], name: "index_comments_on_fabmoment_id"
  end

  create_table "event_machines", force: :cascade do |t|
    t.integer  "event_id"
    t.integer  "machine_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_event_machines_on_event_id"
    t.index ["machine_id"], name: "index_event_machines_on_machine_id"
  end

  create_table "events", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.boolean  "approved"
  end

  create_table "fabmanager_settings", force: :cascade do |t|
    t.time     "max_time_to_occupy_machine"
    t.integer  "max_machines_to_occupy"
    t.boolean  "open_hour"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "fabmoments", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "author_id"
    t.integer  "license_id"
    t.string   "source"
    t.text     "gingGoed"
    t.text     "gingFout"
    t.text     "kanBeter"
    t.boolean  "staff_pick",  default: false
    t.index ["author_id"], name: "index_fabmoments_on_author_id"
    t.index ["license_id"], name: "index_fabmoments_on_license_id"
  end

  create_table "fabmoments_tags", id: false, force: :cascade do |t|
    t.integer "tag_id",       null: false
    t.integer "fabmoment_id", null: false
    t.index ["fabmoment_id", "tag_id"], name: "index_fabmoments_tags_on_fabmoment_id_and_tag_id"
    t.index ["tag_id", "fabmoment_id"], name: "index_fabmoments_tags_on_tag_id_and_fabmoment_id"
  end

  create_table "feeds", force: :cascade do |t|
    t.integer  "fabmoment_id"
    t.integer  "material_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["fabmoment_id"], name: "index_feeds_on_fabmoment_id"
    t.index ["material_id"], name: "index_feeds_on_material_id"
  end

  create_table "handles", force: :cascade do |t|
    t.integer  "fabmoment_id"
    t.integer  "machine_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["fabmoment_id"], name: "index_handles_on_fabmoment_id"
    t.index ["machine_id"], name: "index_handles_on_machine_id"
  end

  create_table "information", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "interfaces", force: :cascade do |t|
    t.integer  "fabmoment_id"
    t.integer  "program_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["fabmoment_id"], name: "index_interfaces_on_fabmoment_id"
    t.index ["program_id"], name: "index_interfaces_on_program_id"
  end

  create_table "licenses", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "machines", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.text     "schedule"
    t.integer  "capacity"
    t.integer  "usage",             default: 0
    t.integer  "usage_duration_id"
    t.index ["usage_duration_id"], name: "index_machines_on_usage_duration_id"
  end

  create_table "materials", force: :cascade do |t|
    t.string   "sort"
    t.string   "name"
    t.integer  "thickness"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "meetings", force: :cascade do |t|
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

  create_table "occupation", force: :cascade do |t|
    t.text     "description"
    t.datetime "begin_time"
    t.datetime "end_time"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "openingtimes", force: :cascade do |t|
    t.string   "title"
    t.string   "monday"
    t.string   "tuesday"
    t.string   "wednesday"
    t.string   "thursday"
    t.string   "friday"
    t.string   "saturday"
    t.string   "sunday"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pictures", force: :cascade do |t|
    t.string   "name"
    t.string   "imageable_type"
    t.integer  "imageable_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.index ["imageable_type", "imageable_id"], name: "index_pictures_on_imageable_type_and_imageable_id"
  end

  create_table "programs", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "project_files", force: :cascade do |t|
    t.string   "name"
    t.integer  "fabmoment_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
    t.index ["fabmoment_id"], name: "index_project_files_on_fabmoment_id"
  end

  create_table "rentings", force: :cascade do |t|
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
  end

  create_table "usage_durations", force: :cascade do |t|
    t.time     "duration"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.index ["user_id"], name: "index_usage_durations_on_user_id"
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
    t.string   "firstname"
    t.string   "insertion"
    t.string   "lastname"
    t.string   "biography"
    t.string   "telephone"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "votes", force: :cascade do |t|
    t.string   "votable_type"
    t.integer  "votable_id"
    t.string   "voter_type"
    t.integer  "voter_id"
    t.boolean  "vote_flag"
    t.string   "vote_scope"
    t.integer  "vote_weight"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["votable_id", "votable_type", "vote_scope"], name: "index_votes_on_votable_id_and_votable_type_and_vote_scope"
    t.index ["voter_id", "voter_type", "vote_scope"], name: "index_votes_on_voter_id_and_voter_type_and_vote_scope"
  end

end
