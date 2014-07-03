class Business < ActiveRecord::Base
   validates_presence_of :bname
   def to_param #overriden to_param in system
      "#{id}-#{bname}"            #use name instead of number e.g. 1
   end 
   def self.search(search)
      if search
         find(:all, :conditions => ['LOWER(bname) like ? OR ? = ANY(bphone)', "%#{search.downcase}%","#{search}"]) 
     else
         self.order(:bname).all
      end
   end
end
