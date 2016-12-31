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

ActiveRecord::Schema.define(version: 20161228060825) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "educations", force: :cascade do |t|
    t.string   "school_name"
    t.string   "school_address"
    t.string   "course_name"
    t.string   "school_logo"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "employments", force: :cascade do |t|
    t.string   "employer_name"
    t.string   "employer_address"
    t.string   "company_logo"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "users", force: :cascade do |t|
    t.boolean  "admin"
    t.datetime "deleted_at"
    t.string   "username"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone"
    t.string   "phone2"
    t.date     "birthday"
    t.string   "gender",                 default: "female"
    t.string   "rel_status"
    t.string   "filepicker_url"
    t.string   "user_street_address"
    t.string   "user_district"
    t.string   "user_city"
    t.string   "user_province"
    t.string   "user_country"
    t.string   "user_region",            default: "Vietnam"
    t.string   "hobbies"
    t.string   "weaknesses"
    t.string   "strengths"
    t.boolean  "verified"
    t.string   "national_id"
    t.string   "drivers_license"
    t.string   "social_security"
    t.string   "voters_id"
    t.string   "status",                 default: "Hello!"
    t.text     "about"
    t.string   "avatar"
    t.string   "photo"
    t.string   "website"
    t.string   "facebook"
    t.string   "linkedin"
    t.string   "skype"
    t.string   "email",                  default: "",        null: false
    t.string   "encrypted_password",     default: "",        null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,         null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "users_eds", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "education_id"
    t.string   "course_name"
    t.date     "from_date"
    t.date     "to_date"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["education_id"], name: "index_users_eds_on_education_id", using: :btree
    t.index ["user_id"], name: "index_users_eds_on_user_id", using: :btree
  end

  create_table "users_emps", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "employment_id"
    t.string   "position"
    t.date     "from_date"
    t.date     "to_date"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["employment_id"], name: "index_users_emps_on_employment_id", using: :btree
    t.index ["user_id"], name: "index_users_emps_on_user_id", using: :btree
  end

  add_foreign_key "users_eds", "educations"
  add_foreign_key "users_eds", "users"
  add_foreign_key "users_emps", "employments"
  add_foreign_key "users_emps", "users"
end
