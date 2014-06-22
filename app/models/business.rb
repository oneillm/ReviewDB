class Business < ActiveRecord::Base
   validates_presence_of :bname
    
   def self.search(search)
      if search
         #any_of({bname: /#{search}/i}, {bphone: /#{search}/i})
      #:conditions => ['LOWER(family_name) like ? OR LOWER (given_name LIKE ?', "%#{params[:search].downcase}%","%#{params[:search].downcase}%"]   
         find(:all, :conditions => ['LOWER(bname) like ? OR ? = ANY(bphone)', "%#{search.downcase}%","#{search}"]) 
     else
         self.all
      end
   end
end
