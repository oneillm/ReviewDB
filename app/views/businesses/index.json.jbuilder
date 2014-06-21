json.array!(@businesses) do |business|
  json.extract! business, :id, :bid, :bname, :btype, :blatitude, :blongitude, :bstreet, :bcity, :bstate, :bzip, :bcountry, :bstatus, :bphone
  json.url business_url(business, format: :json)
end
