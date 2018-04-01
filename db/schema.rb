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

ActiveRecord::Schema.define(version: 20180401231200) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "checklists", force: :cascade do |t|
    t.boolean  "act_score"
    t.boolean  "sat_score"
    t.boolean  "high_school_transcript"
    t.boolean  "previous_college_transcript"
    t.boolean  "i_20"
    t.boolean  "visa_proof"
    t.boolean  "application_fee"
    t.boolean  "online_application"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "school_name"
    t.integer  "school_id"
  end

  add_index "checklists", ["school_id"], name: "index_checklists_on_school_id", unique: true, using: :btree

  create_table "checklists_users", id: false, force: :cascade do |t|
    t.integer "user_id",      null: false
    t.integer "checklist_id", null: false
  end

  add_index "checklists_users", ["checklist_id", "user_id"], name: "index_checklists_users_on_checklist_id_and_user_id", using: :btree
  add_index "checklists_users", ["user_id", "checklist_id"], name: "index_checklists_users_on_user_id_and_checklist_id", using: :btree

  create_table "comments", force: :cascade do |t|
    t.text     "content"
    t.integer  "message_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "comments", ["message_id"], name: "index_comments_on_message_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "messages", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
  end

  create_table "pg_search_documents", force: :cascade do |t|
    t.text     "content"
    t.integer  "searchable_id"
    t.string   "searchable_type"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "pg_search_documents", ["searchable_type", "searchable_id"], name: "index_pg_search_documents_on_searchable_type_and_searchable_id", using: :btree

  create_table "schools", force: :cascade do |t|
    t.string   "name"
    t.string   "abbreviation"
    t.text     "description"
    t.string   "city"
    t.string   "state"
    t.integer  "semester_tuition"
    t.text     "athletics"
    t.text     "school_contact_name"
    t.text     "school_contact_email"
    t.text     "address"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "zip_code"
    t.integer  "phone_number"
    t.integer  "num_students"
    t.integer  "living_expense"
    t.text     "steps"
    t.text     "requirements"
    t.text     "countries_of_international_students"
    t.text     "organizations"
    t.text     "things_to_do_near"
    t.integer  "checklist_id"
  end

  create_table "user_checklists", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "checklist_id"
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
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.date     "date_of_birth"
    t.string   "gender"
    t.string   "last_name"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.boolean  "admin"
    t.string   "school"
    t.boolean  "approved",               default: false, null: false
    t.boolean  "system_admin"
  end

  add_index "users", ["approved"], name: "index_users_on_approved", using: :btree
  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "comments", "messages"
  add_foreign_key "comments", "users"
end
