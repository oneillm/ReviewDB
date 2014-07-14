class Socialmediasite < ActiveRecord::Base

belongs_to :login
#belongs_to :polymorphic => true
has_one :ssdmapping 

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
end
