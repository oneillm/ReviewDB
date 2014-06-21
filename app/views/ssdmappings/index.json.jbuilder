json.array!(@ssdmappings) do |ssdmapping|
  json.extract! ssdmapping, :id, :mappingid, :ssid, :ssdcommentorid, :ssdcommentorname, :ssdcommentortimezone, :ssdpostingtimezone, :ssdcommentorlanguage, :ssdtotalreview, :ssdoverallrating, :ssdcommentorrating, :ssdcomment, :ssdpostat, :ssdcommentorloc
  json.url ssdmapping_url(ssdmapping, format: :json)
end
