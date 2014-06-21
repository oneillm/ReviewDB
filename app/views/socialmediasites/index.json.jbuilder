json.array!(@socialmediasites) do |socialmediasite|
  json.extract! socialmediasite, :id, :ssid, :ssname, :ssurl, :ssurlquery, :ssaccesstoken, :ssaccesstokensecretkey, :ssconsumerkey, :ssconsumersecret, :status, :userid
  json.url socialmediasite_url(socialmediasite, format: :json)
end
