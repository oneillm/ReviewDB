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

end
