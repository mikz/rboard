# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110324135734) do

  create_table "comments", :force => true do |t|
    t.integer  "page_id"
    t.string   "author"
    t.string   "author_url"
    t.string   "author_email"
    t.string   "author_ip"
    t.text     "content"
    t.text     "content_html"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "filter_id",    :limit => 25
    t.string   "user_agent"
    t.string   "referrer"
    t.datetime "approved_at"
    t.integer  "approved_by"
    t.string   "mollom_id"
  end

  create_table "config", :force => true do |t|
    t.string "key",   :limit => 40, :default => "", :null => false
    t.string "value",               :default => ""
  end

  add_index "config", ["key"], :name => "key", :unique => true

  create_table "extension_meta", :force => true do |t|
    t.string  "name"
    t.integer "schema_version", :default => 0
    t.boolean "enabled",        :default => true
  end

  create_table "flow_meters", :force => true do |t|
    t.string   "catch_url"
    t.string   "redirect_url"
    t.string   "status",       :default => "307"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "forums", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "site_id"
    t.integer  "topics_count",  :default => 0
    t.integer  "posts_count",   :default => 0
    t.integer  "position"
    t.integer  "lock_version",  :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "created_by_id"
    t.integer  "updated_by_id"
    t.integer  "reader_id"
    t.integer  "old_id"
  end

  add_index "forums", ["site_id"], :name => "index_forums_on_site_id"

  create_table "layouts", :force => true do |t|
    t.string   "name",          :limit => 100
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "created_by_id"
    t.integer  "updated_by_id"
    t.string   "content_type",  :limit => 40
    t.integer  "lock_version",                 :default => 0
  end

  create_table "message_readers", :force => true do |t|
    t.integer  "site_id"
    t.integer  "message_id"
    t.integer  "reader_id"
    t.datetime "sent_at"
  end

  create_table "messages", :force => true do |t|
    t.integer  "site_id"
    t.string   "subject"
    t.text     "body"
    t.text     "filter_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "created_by_id"
    t.integer  "updated_by_id"
    t.integer  "lock_version"
    t.string   "function_id"
    t.integer  "status_id",     :default => 1
    t.integer  "layout_id"
    t.datetime "sent_at"
  end

  create_table "page_fields", :force => true do |t|
    t.integer "page_id"
    t.string  "name"
    t.string  "content"
  end

  add_index "page_fields", ["page_id", "name", "content"], :name => "index_page_fields_on_page_id_and_name_and_content"

  create_table "page_parts", :force => true do |t|
    t.string  "name",      :limit => 100
    t.string  "filter_id", :limit => 25
    t.text    "content"
    t.integer "page_id"
  end

  add_index "page_parts", ["page_id", "name"], :name => "parts_by_page"

  create_table "pages", :force => true do |t|
    t.string   "title"
    t.string   "slug",            :limit => 100
    t.string   "breadcrumb",      :limit => 160
    t.string   "class_name",      :limit => 25
    t.integer  "status_id",                      :default => 1,     :null => false
    t.integer  "parent_id"
    t.integer  "layout_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "published_at"
    t.integer  "created_by_id"
    t.integer  "updated_by_id"
    t.boolean  "virtual",                        :default => false, :null => false
    t.integer  "lock_version",                   :default => 0
    t.boolean  "enable_comments",                :default => false
    t.integer  "comments_count",                 :default => 0
    t.boolean  "commentable",                    :default => true
    t.boolean  "comments_closed",                :default => false
  end

  add_index "pages", ["class_name"], :name => "pages_class_name"
  add_index "pages", ["parent_id"], :name => "pages_parent_id"
  add_index "pages", ["slug", "parent_id"], :name => "pages_child_slug"
  add_index "pages", ["virtual", "status_id"], :name => "pages_published"

  create_table "post_attachments", :force => true do |t|
    t.integer  "post_id"
    t.integer  "reader_id"
    t.integer  "position"
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "old_id"
  end

  create_table "posts", :force => true do |t|
    t.integer  "reader_id"
    t.integer  "topic_id"
    t.integer  "forum_id"
    t.integer  "site_id"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "created_by_id"
    t.integer  "updated_by_id"
    t.integer  "old_id"
    t.integer  "page_id"
  end

  add_index "posts", ["forum_id", "created_at"], :name => "index_posts_on_forum_id"
  add_index "posts", ["reader_id", "created_at"], :name => "index_posts_on_reader_id"
  add_index "posts", ["site_id"], :name => "index_posts_on_site_id"

  create_table "rboard_banned_ips", :force => true do |t|
    t.string   "ip"
    t.string   "reason"
    t.integer  "banned_by"
    t.datetime "ban_time"
  end

  add_index "rboard_banned_ips", ["ban_time"], :name => "index_banned_ips_on_ban_time"

  create_table "rboard_categories", :force => true do |t|
    t.string  "name"
    t.integer "parent_id"
    t.integer "position"
    t.integer "is_visible_to_id"
    t.string  "description"
  end

  add_index "rboard_categories", ["parent_id"], :name => "index_categories_on_parent_id"

  create_table "rboard_configurations", :force => true do |t|
    t.string "key"
    t.string "value"
    t.text   "description"
    t.string "title"
  end

  create_table "rboard_edits", :force => true do |t|
    t.integer  "user_id"
    t.integer  "post_id"
    t.string   "ip"
    t.text     "original_content"
    t.text     "current_content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "hidden",           :default => false
    t.integer  "ip_id"
  end

  add_index "rboard_edits", ["ip_id"], :name => "index_edits_on_ip_id"

  create_table "rboard_forums", :force => true do |t|
    t.string  "title"
    t.text    "description"
    t.integer "is_visible_to_id"
    t.integer "topics_created_by_id"
    t.integer "position"
    t.integer "parent_id"
    t.integer "last_post_id"
    t.integer "last_post_forum_id"
    t.integer "topics_count",         :default => 0
    t.integer "posts_count",          :default => 0
    t.integer "category_id"
    t.boolean "active",               :default => true
    t.boolean "open",                 :default => true
  end

  add_index "rboard_forums", ["category_id"], :name => "index_forums_on_category_id"
  add_index "rboard_forums", ["open"], :name => "index_forums_on_open"
  add_index "rboard_forums", ["parent_id"], :name => "index_forums_on_parent_id"
  add_index "rboard_forums", ["posts_count"], :name => "index_forums_on_posts_count"
  add_index "rboard_forums", ["topics_count"], :name => "index_forums_on_topics_count"

  create_table "rboard_group_users", :force => true do |t|
    t.integer "user_id"
    t.integer "group_id"
  end

  create_table "rboard_groups", :force => true do |t|
    t.string  "name"
    t.integer "owner_id"
    t.string  "identifier"
  end

  create_table "rboard_groups_users", :id => false, :force => true do |t|
    t.integer "group_id"
    t.integer "user_id"
  end

  create_table "rboard_ip_users", :force => true do |t|
    t.integer  "ip_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rboard_ips", :force => true do |t|
    t.string   "ip",         :limit => 15
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rboard_messages", :force => true do |t|
    t.integer  "from_id"
    t.boolean  "from_read",    :default => false
    t.boolean  "from_deleted", :default => false
    t.integer  "to_id"
    t.boolean  "to_read",      :default => false
    t.boolean  "to_deleted",   :default => false
    t.text     "text"
    t.datetime "created_at"
  end

  create_table "rboard_moderations", :force => true do |t|
    t.integer  "moderated_object_id"
    t.string   "moderated_object_type"
    t.integer  "user_id"
    t.string   "reason"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "forum_id"
  end

  create_table "rboard_permissions", :force => true do |t|
    t.boolean "can_see_forum",                    :default => false
    t.boolean "can_reply_to_topics",              :default => false
    t.boolean "can_post_stickies",                :default => false
    t.boolean "can_start_new_topics",             :default => false
    t.boolean "can_use_signature",                :default => false
    t.boolean "can_delete_own_posts",             :default => false
    t.boolean "can_edit_own_posts",               :default => false
    t.boolean "can_subscribe",                    :default => false
    t.boolean "can_lock_own_topics",              :default => false
    t.boolean "can_ignore_flood_limit",           :default => false
    t.boolean "can_delete_posts",                 :default => false
    t.boolean "can_edit_posts",                   :default => false
    t.boolean "can_lock_topics",                  :default => false
    t.boolean "can_merge_topics",                 :default => false
    t.boolean "can_move_topics",                  :default => false
    t.boolean "can_split_topics",                 :default => false
    t.boolean "can_send_multiple_messages",       :default => false
    t.boolean "can_send_messages_to_groups",      :default => false
    t.boolean "can_read_private_messages",        :default => false
    t.boolean "can_manage_groups",                :default => false
    t.boolean "can_manage_bans",                  :default => false
    t.boolean "can_manage_ranks",                 :default => false
    t.boolean "can_manage_users",                 :default => false
    t.boolean "can_manage_forums",                :default => false
    t.boolean "can_manage_categories",            :default => false
    t.boolean "can_reply_to_locked_topics",       :default => false
    t.boolean "can_edit_topics",                  :default => false
    t.boolean "can_reply",                        :default => false
    t.boolean "can_edit_locked_topics",           :default => false
    t.boolean "can_access_admin_section",         :default => false
    t.boolean "can_see_category",                 :default => false
    t.boolean "can_access_moderator_section",     :default => false
    t.integer "group_id"
    t.integer "forum_id"
    t.integer "category_id"
    t.boolean "default",                          :default => false
    t.boolean "can_manage_themes",                :default => false
    t.boolean "can_edit_own_topics",              :default => false
    t.boolean "can_manage_ips",                   :default => false
    t.boolean "can_manage_posts",                 :default => false
    t.boolean "can_manage_topics",                :default => false
    t.boolean "can_manage_edits",                 :default => false
    t.boolean "can_delete_topics",                :default => false
    t.boolean "can_manage_moderations",           :default => false
    t.boolean "can_read_others_private_messages", :default => false
    t.boolean "can_manage_configurations",        :default => false
    t.boolean "can_see_inactive_forums",          :default => false
    t.boolean "can_post_in_closed_forums",        :default => false
    t.boolean "can_see_hidden_edits",             :default => false
    t.boolean "can_silently_edit",                :default => false
    t.boolean "can_manage_permissions",           :default => false
    t.boolean "can_manage_reports",               :default => false
    t.boolean "can_sticky_topics",                :default => false
  end

  add_index "rboard_permissions", ["category_id"], :name => "index_permissions_on_category_id"
  add_index "rboard_permissions", ["forum_id"], :name => "index_permissions_on_forum_id"
  add_index "rboard_permissions", ["group_id"], :name => "index_permissions_on_group_id"

  create_table "rboard_post_attachments", :force => true do |t|
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.integer  "post_id"
  end

  create_table "rboard_posts", :force => true do |t|
    t.text     "text"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "topic_id"
    t.integer  "edited_by_id"
    t.string   "edit_reason"
    t.boolean  "delta"
    t.boolean  "deleted",      :default => false
    t.integer  "ip_id"
    t.integer  "number",       :default => 1
  end

  add_index "rboard_posts", ["id", "topic_id"], :name => "index_posts_on_id_and_topic_id"
  add_index "rboard_posts", ["ip_id"], :name => "index_posts_on_ip_id"

  create_table "rboard_ranks", :force => true do |t|
    t.string  "name"
    t.integer "posts_required"
    t.boolean "custom",         :default => false
  end

  create_table "rboard_read_topics", :force => true do |t|
    t.integer "user_id"
    t.integer "topic_id"
  end

  create_table "rboard_reports", :force => true do |t|
    t.integer  "user_id"
    t.integer  "reportable_id"
    t.string   "reportable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "text"
  end

  create_table "rboard_schema_migrations", :id => false, :force => true do |t|
    t.string "version", :null => false
  end

  add_index "rboard_schema_migrations", ["version"], :name => "rboard_unique_schema_migrations", :unique => true

  create_table "rboard_subscriptions", :force => true do |t|
    t.integer  "user_id"
    t.integer  "topic_id"
    t.integer  "posts_count"
    t.integer  "integer"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rboard_themes", :force => true do |t|
    t.string  "name"
    t.boolean "is_default", :default => false
  end

  create_table "rboard_topics", :force => true do |t|
    t.integer  "forum_id"
    t.string   "subject"
    t.integer  "user_id"
    t.datetime "created_at"
    t.boolean  "locked",       :default => false
    t.integer  "views",        :default => 0
    t.boolean  "sticky",       :default => false
    t.integer  "last_post_id"
    t.boolean  "delta"
    t.boolean  "deleted",      :default => false
    t.integer  "ip_id"
    t.boolean  "moved",        :default => false
    t.integer  "moved_to_id"
  end

  add_index "rboard_topics", ["id", "forum_id"], :name => "index_topics_on_id_and_forum_id"
  add_index "rboard_topics", ["ip_id"], :name => "index_topics_on_ip_id"

  create_table "rboard_user_levels", :id => false, :force => true do |t|
    t.string  "name"
    t.integer "position"
  end

  create_table "rboard_users", :force => true do |t|
    t.string   "login"
    t.string   "email"
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token"
    t.datetime "remember_token_expires_at"
    t.datetime "previous_login"
    t.string   "signature"
    t.datetime "login_time"
    t.integer  "banned_by"
    t.datetime "ban_time"
    t.string   "ban_reason"
    t.integer  "ban_times",                               :default => 0
    t.string   "location"
    t.text     "description"
    t.text     "website"
    t.integer  "rank_id"
    t.integer  "user_level_id",                           :default => 1
    t.integer  "theme_id"
    t.string   "ip",                        :limit => 15
    t.string   "date_display",                            :default => "%d %B %Y"
    t.string   "time_display",                            :default => "%I:%M:%S%P"
    t.integer  "per_page",                                :default => 30
    t.string   "encrypted_email"
    t.string   "time_zone"
    t.string   "display_name"
    t.string   "permalink"
    t.boolean  "auto_subscribe",                          :default => true
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.string   "identifier"
  end

  create_table "readers", :force => true do |t|
    t.integer  "site_id"
    t.string   "name",                    :limit => 100
    t.string   "email"
    t.string   "login",                   :limit => 40,  :default => "",    :null => false
    t.string   "crypted_password"
    t.text     "description"
    t.text     "notes"
    t.boolean  "trusted",                                :default => true
    t.boolean  "receive_email",                          :default => false
    t.boolean  "receive_essential_email",                :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "created_by_id"
    t.integer  "updated_by_id"
    t.string   "password_salt"
    t.string   "session_token"
    t.string   "provisional_password"
    t.datetime "activated_at"
    t.string   "honorific"
    t.integer  "user_id"
    t.datetime "last_request_at"
    t.datetime "last_login_at"
    t.string   "persistence_token",                      :default => "",    :null => false
    t.string   "single_access_token",                    :default => "",    :null => false
    t.string   "perishable_token",                       :default => "",    :null => false
    t.integer  "login_count",                            :default => 0,     :null => false
    t.integer  "failed_login_count",                     :default => 0,     :null => false
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.string   "clear_password"
    t.string   "forename"
    t.string   "phone"
    t.string   "organisation"
    t.string   "post_building"
    t.string   "post_street"
    t.string   "post_place"
    t.string   "post_town"
    t.string   "post_county"
    t.string   "postcode"
    t.integer  "posts_count",                            :default => 0
    t.integer  "old_id"
  end

  add_index "readers", ["session_token"], :name => "session_token"

  create_table "sessions", :force => true do |t|
    t.string   "session_id"
    t.text     "data"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "snippets", :force => true do |t|
    t.string   "name",          :limit => 100, :default => "", :null => false
    t.string   "filter_id",     :limit => 25
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "created_by_id"
    t.integer  "updated_by_id"
    t.integer  "lock_version",                 :default => 0
  end

  add_index "snippets", ["name"], :name => "name", :unique => true

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "taggable_type"
    t.string   "context"
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type", "context"], :name => "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", :force => true do |t|
    t.string  "name"
    t.boolean "private", :default => false, :null => false
  end

  add_index "tags", ["private"], :name => "index_tags_on_private"

  create_table "topics", :force => true do |t|
    t.integer  "forum_id"
    t.integer  "site_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "replied_at"
    t.integer  "hits",          :default => 0
    t.boolean  "sticky",        :default => false
    t.boolean  "locked",        :default => false
    t.integer  "replied_by_id"
    t.integer  "old_id"
  end

  add_index "topics", ["forum_id", "replied_at"], :name => "index_topics_on_forum_id_and_replied_at"
  add_index "topics", ["forum_id", "sticky", "replied_at"], :name => "index_topics_on_sticky_and_replied_at"
  add_index "topics", ["forum_id"], :name => "index_topics_on_forum_id"
  add_index "topics", ["site_id"], :name => "index_topics_on_site_id"

  create_table "users", :force => true do |t|
    t.string   "name",                      :limit => 100
    t.string   "email"
    t.string   "login",                     :limit => 40,  :default => "",           :null => false
    t.string   "password",                  :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "created_by_id"
    t.integer  "updated_by_id"
    t.boolean  "admin",                                    :default => false,        :null => false
    t.boolean  "designer",                                 :default => false,        :null => false
    t.text     "notes"
    t.integer  "lock_version",                             :default => 0
    t.string   "salt"
    t.string   "session_token"
    t.string   "locale"
    t.string   "remember_token"
    t.datetime "remember_token_expires_at"
    t.datetime "previous_login"
    t.string   "signature"
    t.datetime "login_time"
    t.integer  "banned_by"
    t.datetime "ban_time"
    t.string   "ban_reason"
    t.integer  "ban_times",                                :default => 0
    t.string   "location"
    t.text     "description"
    t.text     "website"
    t.integer  "rank_id"
    t.integer  "user_level_id",                            :default => 1
    t.integer  "theme_id"
    t.string   "ip",                        :limit => 15
    t.string   "date_display",                             :default => "%d %B %Y"
    t.string   "time_display",                             :default => "%I:%M:%S%P"
    t.integer  "per_page",                                 :default => 30
    t.string   "encrypted_email"
    t.string   "time_zone"
    t.string   "display_name"
    t.string   "permalink"
    t.boolean  "auto_subscribe",                           :default => true
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.string   "identifier"
  end

  add_index "users", ["id", "user_level_id"], :name => "index_users_on_id_and_user_level_id"
  add_index "users", ["login"], :name => "index_users_on_login"
  add_index "users", ["login"], :name => "login", :unique => true
  add_index "users", ["login_time"], :name => "index_users_on_login_time"

end
