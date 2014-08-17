class Ssdmapping < ActiveRecord::Base
belongs_to :ssname, :class_name => Socialmediasite, :foreign_key => :ssid  # , :order => :ssname

def to_param
     "#{mappingid}-#{ssname}"
end
def self.search(search)
      if search
 #           Ssdmapping.scoped(:include => :socialmediasite, :conditions =>{ :socialmediasites =>{ ['LOWER(ssname) like ?',"%#{search.downcase}%"]}})  
            Ssdmapping.include(:ssname).where ( ['LOWER(socialmediasites.ssname) like ?',"%#{search.downcase}%"]).order(socialmediasites.ssname ASC) 
            #Ssdmapping.include(:ssname).where ( ['LOWER(socialmediasites.ssname) like ?',"%#{search.downcase}%"]).order(ssname: {:sname ASC}) 
     else
           Ssdmapping.all
      # Ssdmapping.all  
    end
end

def currentusermapping
      Socialmediasite.scoped(:joins => :login, :conditions => { :logins => current_login})
end

end
