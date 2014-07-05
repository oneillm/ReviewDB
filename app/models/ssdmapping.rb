class Ssdmapping < ActiveRecord::Base
belongs_to :socialmediasite

def to_param
     "#{mappingid}"
end


end
