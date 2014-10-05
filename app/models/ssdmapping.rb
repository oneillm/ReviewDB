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
   "e.g. mapping from twitter : User.Screen_Name"

end
   
def self.commentornametip
"e.g.(from Google Place Search) result.reviews.author_name, (from twitter) user.name"
end
def self.commentortimezonetip
"e.g. (from twitter) user.time_zone"
end
def self.postingtimezonetip
"e.g. (from twitter) user.time_zone"
end
def self.postingURLtip
"e.g. (from twitter) statuses.source (from yelp) reviews.url"
end
def self.commentorlanguagetip
"e.g. (from Google Place Search ) result.reviews.language, (from twitter) user.lang"
end
def self.totalpostingreviewstip
"e.g. (from twitter) user.statuses_count"
end
def self.overallratingtip
"e.g. (from Google Place Search ) result.rating"
end
def self.ratingbycommentortip
"e.g. (from Google Place Search ) result.reviews.rating"
end
def self.reviewcommenttip
"e.g. (from Google Place Search ) result.reviews.text, (from twitter) text"
end
def self.reviewpostedattip
"e.g. (from Google Place Search ) result.reviews.time, (from twitter) created_at"

end
def self.commentorlocationtip
"e.g. (from twitter) user.location"
end


end
