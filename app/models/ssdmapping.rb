class Ssdmapping < ActiveRecord::Base
belongs_to :ssname, :class_name => Socialmediasite, :foreign_key => :ssid

def to_param
     "#{mappingid}-#{ssname}"
end


end
