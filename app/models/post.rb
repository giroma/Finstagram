class Post < ActiveRecord::Base
    belongs_to :user
    has_many :likes
    has_many :comments
    
    validates_presence_of :photo_url, :user
    
    def humanized_time_ago
        time_ago_in_seconds= Time.now - self.created_at
        time_ago_in_minutes= time_ago_in_seconds/60
         # if the time ago is more than 60
        if time_ago_in_minutes >= 60 and time_ago_in_minutes < 1400
            #return this string
            "#{(time_ago_in_minutes/60).to_i} hours ago"
        elsif
            # if times is above 24hours display as days
            time_ago_in_minutes >= 1440
            #return this string
            "#{(time_ago_in_minutes/1440).to_i} days ago"
        else
        # else return this string
            "#{time_ago_in_minutes.to_i} minutes ago"
        end
    end
    
    def like_count
        self.likes.size
    end
    def comment_count
        self.comments.size
    end
    
end