class Ssdmapping < ActiveRecord::Base
belongs_to :ssname, :class_name => Socialmediasite, :foreign_key => :ssid  # , :order => :ssname
#validates_presence_of :ssid
def to_param
     "#{mappingid}-#{ssname}"
end
def self.search(search)
      if search
    		Ssdmapping.includes(:ssname).where ( ['LOWER(socialmediasites.ssname) like ?',"%#{search.downcase}%"])
    else
          self.all
      # Ssdmapping.where(nil)  
    end
end

def currentusermapping
      Socialmediasite.scoped(:joins => :login, :conditions => { :logins => current_login})
end

def self.commentoridtip
   "e.g. mapping from twitter for Posting CommentorID: User.Screen_Name"

end
   
def self.commentornametip
"e.g. mapping for Posting Commentor Name:(from Google Place Search) result.reviews.author_name, (from twitter) user.name"
end
def self.commentortimezonetip
"e.g. mapping for Commentor TimeZone: (from twitter) user.time_zone"
end
def self.postingtimezonetip
"e.g. mapping for Posting TimeZone: (from twitter) user.time_zone"
end
def self.commentorlanguagetip
"e.g. mapping for Commentor Language: (from Google Place Search ) result.reviews.language, (from twitter) user.lang"
end
def self.totalpostingreviewstip
"e.g. mapping for Commentor Language: (from twitter) user.statuses_count"
end
def self.overallratingtip
"e.g. mapping for Overall Rating: (from Google Place Search ) result.rating"
end
def self.ratingbycommentortip
"e.g. mapping for Rating by Commentor: (from Google Place Search ) result.reviews.rating"
end
def self.reviewcommenttip
"e.g. mapping for Review Comment: (from Google Place Search ) result.reviews.text, (from twitter) text"
end
def self.reviewpostedattip
"e.g. mapping for Review Posted At: (from Google Place Search ) result.reviews.time, (from twitter) created_at"

end
def self.commentorlocationtip
"e.g. mapping for Commentor Location: (from twitter) user.location"
end


end
