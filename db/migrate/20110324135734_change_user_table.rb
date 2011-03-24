class ChangeUserTable < ActiveRecord::Migration
  def self.prefix(prefix, &block)
    orig_prefix = ActiveRecord::Base.table_name_prefix
    ActiveRecord::Base.table_name_prefix = prefix
    yield
    ActiveRecord::Base.table_name_prefix = orig_prefix
  end
  
  def self.up
    prefix nil do
    
      change_table :users do |t|
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
        t.string   "permalink"
        t.boolean  "auto_subscribe",                          :default => true
        t.string   "avatar_file_name"
        t.string   "avatar_content_type"
        t.integer  "avatar_file_size"
        t.string   "identifier"
      end
    
      add_index "users", ["id", "user_level_id"]
      add_index "users", ["login"]
      add_index "users", ["login_time"]
 
    end
    
  end

  def self.down
    prefix nil do
      remove_columns :users, "remember_token", "remember_token_expires_at",
        "previous_login", "signature", "login_time", "banned_by", "ban_time",
        "ban_reason", "ban_times", "location", "description", "website", "rank_id",
        "user_level_id", "theme_id", "ip", "date_display", "time_display", "per_page",
        "encrypted_email", "time_zone", "display_name", "permalink", "auto_subscribe",
        "avatar_file_name", "avatar_content_type", "avatar_file_size", "identifier"
      
      remove_index"users", ["id", "user_level_id"]
      remove_index "users", ["login"]
      remove_index "users", ["login_time"]
      
    end
  end
end
