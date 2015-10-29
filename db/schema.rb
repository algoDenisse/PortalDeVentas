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

ActiveRecord::Schema.define(version: 20150923044531) do

  create_table "articles", force: :cascade do |t|
    t.string   "name",               limit: 255
    t.integer  "price",              limit: 4
    t.integer  "likes",              limit: 4,   default: 0
    t.string   "description",        limit: 255
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.integer  "articleable_id",     limit: 4
    t.string   "articleable_type",   limit: 255
    t.integer  "category_id",        limit: 4
    t.integer  "state",              limit: 4
    t.integer  "imageable_id",       limit: 4
    t.string   "imageable_type",     limit: 255
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size",    limit: 4
    t.datetime "image_updated_at"
    t.integer  "flaggings_count",    limit: 4
  end

  add_index "articles", ["category_id"], name: "index_articles_on_category_id", using: :btree
  add_index "articles", ["imageable_type", "imageable_id"], name: "index_articles_on_imageable_type_and_imageable_id", using: :btree

  create_table "categories", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "flaggings", force: :cascade do |t|
    t.string   "flaggable_type", limit: 255
    t.integer  "flaggable_id",   limit: 4
    t.string   "flagger_type",   limit: 255
    t.integer  "flagger_id",     limit: 4
    t.text     "reason",         limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "flaggings", ["flaggable_type", "flaggable_id"], name: "index_flaggings_on_flaggable_type_and_flaggable_id", using: :btree
  add_index "flaggings", ["flagger_type", "flagger_id", "flaggable_type", "flaggable_id"], name: "access_flaggings", using: :btree

  create_table "notifications", force: :cascade do |t|
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "notable_id",   limit: 4
    t.string   "notable_type", limit: 255
    t.integer  "article_id",   limit: 4
    t.string   "notification", limit: 255
  end

  add_index "notifications", ["article_id"], name: "index_notifications_on_article_id", using: :btree
  add_index "notifications", ["notable_type", "notable_id"], name: "index_notifications_on_notable_type_and_notable_id", using: :btree

  create_table "reviews", force: :cascade do |t|
    t.string   "comment",         limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "reviewable_id",   limit: 4
    t.string   "reviewable_type", limit: 255
    t.integer  "article_id",      limit: 4
    t.integer  "state",           limit: 4
  end

  add_index "reviews", ["article_id"], name: "index_reviews_on_article_id", using: :btree
  add_index "reviews", ["reviewable_type", "reviewable_id"], name: "index_reviews_on_reviewable_type_and_reviewable_id", using: :btree

  create_table "user_types", force: :cascade do |t|
    t.string   "type",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "userfbs", force: :cascade do |t|
    t.string   "provider",         limit: 255
    t.string   "uid",              limit: 255
    t.string   "name",             limit: 255
    t.string   "oauth_token",      limit: 255
    t.datetime "oauth_expires_at"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "user_type_id",     limit: 4
    t.integer  "role",             limit: 4
    t.string   "email",            limit: 255
    t.integer  "flaggings_count",  limit: 4
  end

  add_index "userfbs", ["user_type_id"], name: "index_userfbs_on_user_type_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name",            limit: 255
    t.string   "email",           limit: 255
    t.string   "password_digest", limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "user_type_id",    limit: 4
    t.integer  "role",            limit: 4
    t.integer  "flaggings_count", limit: 4
  end

  add_index "users", ["user_type_id"], name: "index_users_on_user_type_id", using: :btree

  add_foreign_key "articles", "categories"
  add_foreign_key "notifications", "articles"
  add_foreign_key "reviews", "articles"
  add_foreign_key "userfbs", "user_types"
  add_foreign_key "users", "user_types"
end
