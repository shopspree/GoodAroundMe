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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20131107232323) do

  create_table "activities", :force => true do |t|
    t.integer  "context_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.integer  "timelineable_id"
    t.string   "timelineable_type"
    t.integer  "actor_id"
  end

  create_table "actors", :force => true do |t|
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.integer  "context_id"
    t.integer  "notifications_count"
    t.integer  "actorable_id"
    t.string   "actorable_type"
    t.integer  "posts_count"
  end

  create_table "address_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "addresses", :force => true do |t|
    t.string   "title"
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.string   "zipcode"
    t.integer  "address_type_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "associations", :force => true do |t|
    t.integer  "group_id"
    t.integer  "person_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "audiences", :force => true do |t|
    t.integer  "audienceable_id"
    t.string   "audienceable_type"
    t.string   "audience_type"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.integer  "activity_id"
  end

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "comments", :force => true do |t|
    t.text     "content",                     :limit => 255
    t.integer  "actor_id"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.datetime "created_at",                                                :null => false
    t.datetime "updated_at",                                                :null => false
    t.integer  "comments_count",                             :default => 0
    t.integer  "likes_count",                                :default => 0
    t.integer  "inappropriate_reports_count",                :default => 0
  end

  create_table "contexts", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "delayed_jobs", :force => true do |t|
    t.integer  "priority",   :default => 0, :null => false
    t.integer  "attempts",   :default => 0, :null => false
    t.text     "handler",                   :null => false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "delayed_jobs", ["priority", "run_at"], :name => "delayed_jobs_priority"

  create_table "domains", :force => true do |t|
    t.string   "name"
    t.boolean  "blacklist"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "organization_id"
  end

  create_table "external_organizations", :force => true do |t|
    t.integer  "external_id"
    t.string   "external_type"
    t.integer  "organization_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "facebook_pages", :force => true do |t|
    t.string   "identifier"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "organization_id"
  end

  create_table "facebook_posts", :force => true do |t|
    t.integer  "facebook_run_id",     :limit => 255
    t.integer  "post_id"
    t.string   "facebook_type"
    t.string   "facebook_object_id"
    t.string   "facebook_id"
    t.datetime "facebook_created_at"
    t.datetime "facebook_updated_at"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
  end

  create_table "facebook_runs", :force => true do |t|
    t.integer  "facebook_page_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.string   "status"
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "last_run"
  end

  create_table "follows", :force => true do |t|
    t.integer  "person_id"
    t.integer  "organization_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "group_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "groups", :force => true do |t|
    t.string   "name"
    t.integer  "group_type"
    t.integer  "context_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "hashtags", :force => true do |t|
    t.string   "key"
    t.string   "value"
    t.integer  "actor_id"
    t.integer  "context_id"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
    t.integer  "tags_count", :default => 0
  end

  create_table "inappropriate_reports", :force => true do |t|
    t.integer  "reportable_id"
    t.string   "reportable_type"
    t.string   "report_type"
    t.integer  "actor_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "job_profiles", :force => true do |t|
    t.string   "title"
    t.integer  "actor_id"
    t.integer  "organization_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "email"
  end

  create_table "likes", :force => true do |t|
    t.integer  "actor_id"
    t.integer  "likeable_id"
    t.string   "likeable_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "media", :force => true do |t|
    t.string   "url_string"
    t.integer  "post_id"
    t.integer  "media_type_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "mediable_id"
    t.string   "mediable_type"
  end

  create_table "media_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "mention_actors", :force => true do |t|
    t.integer  "actor_id"
    t.integer  "mention_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "mentions", :force => true do |t|
    t.integer  "actor_id"
    t.integer  "mentionable_id"
    t.string   "mentionable_type"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "notifications", :force => true do |t|
    t.boolean  "is_read"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
    t.integer  "notificationable_id"
    t.string   "notificationable_type"
    t.integer  "person_id"
  end

  create_table "operators", :force => true do |t|
    t.string   "email"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "person_id"
    t.integer  "organization_id"
  end

  create_table "organization_categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "image_url"
  end

  create_table "organization_organization_categories", :force => true do |t|
    t.integer  "organization_id"
    t.integer  "organization_category_id"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  create_table "organizations", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.integer  "context_id"
    t.string   "image_thumbnail_url"
    t.text     "about",               :limit => 255
    t.string   "website_url"
    t.string   "location"
    t.integer  "count_of_followers"
  end

  create_table "people", :force => true do |t|
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
    t.integer  "context_id"
    t.integer  "user_id"
    t.integer  "followings_count", :default => 0
  end

  create_table "photos", :force => true do |t|
    t.string   "url"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "post_subcategories", :force => true do |t|
    t.integer  "post_id"
    t.integer  "subcategory_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "posts", :force => true do |t|
    t.text     "caption",                     :limit => 255
    t.integer  "actor_id"
    t.datetime "created_at",                                                :null => false
    t.datetime "updated_at",                                                :null => false
    t.integer  "likes_count",                                :default => 0
    t.integer  "comments_count",                             :default => 0
    t.integer  "inappropriate_reports_count",                :default => 0
    t.integer  "subcategories_count"
    t.integer  "contributor_id"
    t.string   "title"
    t.string   "source"
  end

  create_table "problems", :force => true do |t|
    t.string   "area"
    t.text     "report"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.string   "screenshot_url"
    t.integer  "actor_id"
  end

  create_table "profiles", :force => true do |t|
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.string   "name_prefix"
    t.string   "name_suffix"
    t.date     "birthday"
    t.string   "gender"
    t.integer  "address_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "email"
    t.string   "thumbnail_url"
    t.string   "picture_url"
    t.string   "display_name"
    t.integer  "person_id"
    t.string   "about"
  end

  create_table "robots", :force => true do |t|
    t.string   "name"
    t.string   "display_name"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "subcategories", :force => true do |t|
    t.integer  "actor_id"
    t.integer  "context_id"
    t.string   "name"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "category_id"
    t.integer  "posts_count"
  end

  create_table "tags", :force => true do |t|
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "hashtag_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "tesets", :force => true do |t|
    t.string   "str"
    t.integer  "int"
    t.datetime "d"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "",    :null => false
    t.string   "encrypted_password",     :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "authentication_token"
    t.boolean  "admin",                  :default => false
    t.boolean  "approved",               :default => false
    t.integer  "approver_id"
  end

  add_index "users", ["authentication_token"], :name => "index_users_on_authentication_token", :unique => true
  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "videos", :force => true do |t|
    t.string   "url"
    t.string   "image_url"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "waiting_lists", :force => true do |t|
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "rank"
  end

  add_index "waiting_lists", ["rank"], :name => "index_waiting_lists_on_rank"
  add_index "waiting_lists", ["user_id"], :name => "index_waiting_lists_on_user_id"

end
