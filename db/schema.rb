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

ActiveRecord::Schema.define(version: 20160715122110) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string   "address"
    t.string   "street_number"
    t.string   "route"
    t.string   "locality"
    t.string   "country"
    t.string   "postal_code"
    t.integer  "placeable_id"
    t.string   "placeable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "assets", force: :cascade do |t|
    t.integer  "viewable_id"
    t.string   "viewable_type"
    t.string   "attachment"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "availabilities", force: :cascade do |t|
    t.datetime "start_at"
    t.datetime "end_at"
    t.string   "available_type"
    t.integer  "nb_total_places"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "components", force: :cascade do |t|
    t.string "name", null: false
  end

  create_table "events", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "availability_id"
    t.integer  "amount"
    t.integer  "reduced_amount"
    t.integer  "nb_total_places"
    t.integer  "recurrence_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["availability_id"], name: "index_events_on_availability_id", using: :btree
    t.index ["recurrence_id"], name: "index_events_on_recurrence_id", using: :btree
  end

  create_table "events_categories", force: :cascade do |t|
    t.integer  "event_id"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["category_id"], name: "index_events_categories_on_category_id", using: :btree
    t.index ["event_id"], name: "index_events_categories_on_event_id", using: :btree
  end

  create_table "fabmoments", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree
  end

  create_table "groups", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "licences", force: :cascade do |t|
    t.string "name",        null: false
    t.text   "description"
  end

  create_table "machines", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.text     "spec"
    t.string   "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["slug"], name: "index_machines_on_slug", unique: true, using: :btree
  end

  create_table "notifications", force: :cascade do |t|
    t.integer  "receiver_id"
    t.integer  "attached_object_id"
    t.string   "attached_object_type"
    t.integer  "notification_type_id"
    t.boolean  "is_read",              default: false
    t.string   "receiver_type"
    t.boolean  "is_send",              default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["notification_type_id"], name: "index_notifications_on_notification_type_id", using: :btree
    t.index ["receiver_id"], name: "index_notifications_on_receiver_id", using: :btree
  end

  create_table "profiles", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "first_name"
    t.string   "last_name"
    t.boolean  "gender"
    t.date     "birthday"
    t.string   "phone"
    t.text     "interest"
    t.text     "software_mastered"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["user_id"], name: "index_profiles_on_user_id", using: :btree
  end

  create_table "project_steps", force: :cascade do |t|
    t.text     "description"
    t.string   "title"
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["project_id"], name: "index_project_steps_on_project_id", using: :btree
  end

  create_table "project_users", force: :cascade do |t|
    t.integer  "project_id"
    t.integer  "user_id"
    t.boolean  "is_valid",    default: false
    t.string   "valid_token"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["project_id"], name: "index_project_users_on_project_id", using: :btree
    t.index ["user_id"], name: "index_project_users_on_user_id", using: :btree
  end

  create_table "projects", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "slug"
    t.datetime "published_at"
    t.integer  "author_id"
    t.text     "tags"
    t.string   "state"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "licence_id"
    t.index ["slug"], name: "index_projects_on_slug", unique: true, using: :btree
  end

  create_table "projects_components", force: :cascade do |t|
    t.integer "project_id"
    t.integer "component_id"
    t.index ["component_id"], name: "index_projects_components_on_component_id", using: :btree
    t.index ["project_id"], name: "index_projects_components_on_project_id", using: :btree
  end

  create_table "projects_machines", force: :cascade do |t|
    t.integer "project_id"
    t.integer "machine_id"
    t.index ["machine_id"], name: "index_projects_machines_on_machine_id", using: :btree
    t.index ["project_id"], name: "index_projects_machines_on_project_id", using: :btree
  end

  create_table "projects_themes", force: :cascade do |t|
    t.integer "project_id"
    t.integer "theme_id"
    t.index ["project_id"], name: "index_projects_themes_on_project_id", using: :btree
    t.index ["theme_id"], name: "index_projects_themes_on_theme_id", using: :btree
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
    t.index ["name"], name: "index_roles_on_name", using: :btree
  end

  create_table "themes", force: :cascade do |t|
    t.string "name", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",   null: false
    t.string   "encrypted_password",     default: "",   null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,    null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,    null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.boolean  "is_allow_contact",       default: true
    t.string   "username"
    t.string   "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "group_id"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["group_id"], name: "index_users_on_group_id", using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["slug"], name: "index_users_on_slug", unique: true, using: :btree
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree
    t.index ["username"], name: "index_users_on_username", unique: true, using: :btree
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", using: :btree
  end

  add_foreign_key "events_categories", "categories"
  add_foreign_key "events_categories", "events"
  add_foreign_key "profiles", "users"
  add_foreign_key "project_steps", "projects"
  add_foreign_key "project_users", "projects"
  add_foreign_key "project_users", "users"
  add_foreign_key "projects_components", "components"
  add_foreign_key "projects_components", "projects"
  add_foreign_key "projects_machines", "machines"
  add_foreign_key "projects_machines", "projects"
  add_foreign_key "projects_themes", "projects"
  add_foreign_key "projects_themes", "themes"
end
