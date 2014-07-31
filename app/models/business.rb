class Business < ActiveRecord::Base
   validates_presence_of :bname
   validates_presence_of :bphone
   geocoded_by :address, :latitude => :blatitude, :longitude => :blongitude
   after_validation :geocode, :if => :address_changed?
   default_scope ->{ order('bname')}
   has_many :ssdmetadata
   has_many :sscommentordata
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
   
   def address
      "#{bstreet},#{bcity},#{bstate},#{bzip},#{bcountry}"
   end
   
   def address_changed?
      bstreet_changed? || bcity_changed? || bstate_changed? || bzip_changed? || bcountry_changed? 
   end
end
