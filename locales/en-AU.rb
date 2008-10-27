{
  :'en-AU' => {
    :date => {
      :formats => {
        :default      => "%d/%m/%Y",
        :short        => "%e %b",
        :long         => "%e %B, %Y",
        :long_ordinal => lambda { |date| "#{date.day.ordinalize} %B, %Y" },
        :only_day     => "%e"
      },
      :day_names => Date::DAYNAMES,
      :abbr_day_names => Date::ABBR_DAYNAMES,
      :month_names => Date::MONTHNAMES,
      :abbr_month_names => Date::ABBR_MONTHNAMES,
      :order => [:year, :month, :day]
    },
    :time => {
      :formats => {
        :default      => "%a %b %d %H:%M:%S %Z %Y",
        :time         => "%H:%M",
        :short        => "%d %b %H:%M",
        :long         => "%d %B, %Y %H:%M",
        :long_ordinal => lambda { |time| "#{time.day.ordinalize} %B, %Y %H:%M" },
        :only_second  => "%S"
      },
      :datetime => {
        :formats => {
          :default => "%Y-%m-%dT%H:%M:%S%Z"
        }
      },
      :time_with_zone => {
        :formats => {
          :default => lambda { |time| "%Y-%m-%d %H:%M:%S #{time.formatted_offset(false, 'UTC')}" }
        }
      },
      :am => 'am',
      :pm => 'pm'
    },
    :datetime => {
      :distance_in_words => {
        :half_a_minute       => 'half a minute',
        :less_than_x_seconds => {:zero => 'less than a second', :one => 'less than a second', :other => 'less than {{count}} seconds'},
        :x_seconds           => {:one => '1 second', :other => '{{count}} seconds'},
        :less_than_x_minutes => {:zero => 'less than a minute', :one => 'less than a minute', :other => 'less than {{count}} minutes'},
        :x_minutes           => {:one => "1 minute", :other => "{{count}} minutes"},
        :about_x_hours       => {:one => 'about 1 hour', :other => 'about {{count}} hours'},
        :x_days              => {:one => '1 day', :other => '{{count}} days'},
        :about_x_months      => {:one => 'about 1 month', :other => 'about {{count}} months'},
        :x_months            => {:one => '1 month', :other => '{{count}} months'},
        :about_x_years       => {:one => 'about 1 year', :other => 'about {{count}} years'},
        :over_x_years        => {:one => 'over 1 year', :other => 'over {{count}} years'}
      }
    },
    :number => {
      :format => {
        :precision => 2,
        :separator => ',',
        :delimiter => '.'
      },
      :currency => {
        :format => {
          :unit => 'AUD',
          :precision => 2,
          :format => '%n %u'
        }
      }
    },

    # Active Record
    :active_record => {
      :error => {
        :header_message => ["Couldn't save this {{object_name}}: 1 error", "Couldn't save this {{object_name}}: {{count}} errors."],
        :message => "Please check the following fields, dude:"
      }
    },
    :active_record => {
      :error_messages => {
        :inclusion => "ain't included in the list",
        :exclusion => "ain't available",
        :invalid => "ain't valid",
        :confirmation => "don't match its confirmation",
        :accepted  => "gotta be accepted",
        :empty => "gotta be given",
        :blank => "gotta be given",
        :too_long => "is too long-ish (no more than {{count}} characters)",
        :too_short => "is too short-ish (no less than {{count}} characters)",
        :wrong_length => "ain't got the right length (gotta be {{count}} characters)",
        :taken => "ain't available",
        :not_a_number => "ain't a number",
        :greater_than => "gotta be greater than {{count}}",
        :greater_than_or_equal_to => "gotta be greater than or equal to {{count}}",
        :equal_to => "gotta be equal to {{count}}",
        :less_than => "gotta be less than {{count}}",
        :less_than_or_equal_to => "gotta be less than or equal to {{count}}",
        :odd => "gotta be odd",
        :even => "gotta be even"
      }
    },
   :forum_heading => "Forum",
   :topics_heading => "Topics",
   :posts_heading => "Posts",
   :last_post_heading => "Last Post",
   :no_forums => "There are no forums.", 
   :administrator_should_create_forum => "Maybe an administrator should create one.",
   :you_should_create_forum => "Maybe you should create a forum.",
   :forum_statistics => "Forum Statistics",
   :posts_per_topic => "Posts per topic",
   :recent_users => "Users on in the last 15 minutes",
   :registered_users => "Registered Users",
   :home => "Home",
   :edit_profile => "Edit Profile",
   :member_list => "Member List",
   :search => "Search",
   :new_message => "new message",
   :logout => "Logout",
   :time_now => "The time is now",
   :viewing_forum => "Viewing forum",
   :new_topic => "New Topic",
   :moderation_heading => "Moderation",
   :topic_heading => "Topic",
   :replies_heading => "Replies",
   :views_heading => "Views",
   :author_heading => "Author",
   :ago => "ago",
   :by => "by"
  }
}