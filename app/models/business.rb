class Business < ActiveRecord::Base
   validates_presence_of :bname
    
   def self.search(search)
      if search
         find(:all, :conditions => ['LOWER(bname) like ? OR ? = ANY(bphone)', "%#{search.downcase}%","#{search}"]) 
     else
         self.all
      end
   end
end
