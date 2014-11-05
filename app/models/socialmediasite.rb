class Socialmediasite < ActiveRecord::Base
   validates_presence_of :ssname
   validates_presence_of :ssurl
belongs_to :login
#belongs_to :polymorphic => true
has_one :ssdmapping 
has_many :sscommentordata
has_many :ssdmetadata

include HTTParty
format :json
def to_param   #overriden to_param in system
      "#{ssid}-#{ssname}"            #use name instead of number e.g. 1
end 
   def self.search(search)
      if search
         find(:all, :conditions => ['LOWER(ssname) like ? ', "%#{search.downcase}%"]) 
     else
         self.order(:ssname).all
     end
   end
def self.sitename
   "e.g. twitter, google, etc"
end
def self.ssurlquery
   "2nd part of the URL for API keys e.g.(google)&key= (for twitter no need to enter)"
end
def self.accesstoken
   "Access token issued by Social Media Site, if any"
end
def self.accesstokenkey
   "Access token secret key issued by Social Media Site, if any"
end
def self.consumerkey
   "Consumer key issued by social media site, if any"
end
def self.consumersecret
   "Consumer secret key issued by social media site, if any"
end
def self.searchby
   "Select data request searching by Business Name or Phone number."
end
def self.urlstring
   "string before business names to search e.g. (google) https://maps.googleapis.com/maps/api/place/details/json?placeid= (for twitter) https://api.twitter.com/1.1/search/tweets.json?q="
end

end
