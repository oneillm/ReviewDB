class Ssdmapping < ActiveRecord::Base
belongs_to :ssname, :class_name => Socialmediasite, :foreign_key => :ssid  # , :order => :ssname
has_one :socialmediasite
validates_presence_of :ssid  , :message => "You must select an API provider!"
validates_associated :ssname

  
def to_param
     "#{mappingid}-#{ssname.ssname}"
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

def self.recursive_select( key, object, path=[] )
  matches = []
  case object
  when Array
    object.each_with_index do |el, i|
      if el.is_a?(Hash) || el.is_a?(Array)
        res = recursive_select( key, el, path )
        matches += res if res
      end
    end
  when Hash
    matches << {'path'=>path+[key],'value'=>object[key].to_s} if
object.has_key? key
    object.each do |k,v|
      if v.is_a?(Hash) || v.is_a?(Array)
        res = recursive_select( key, v, path+[k] )
        matches += res if res

      end
    end
  end
  matches.any? ? matches : nil
end

end
