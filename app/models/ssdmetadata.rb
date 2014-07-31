class Ssdmetadata < ActiveRecord::Base

belongs_to :ssid, :class_name => Socialmediasite, :foreign_key => :ssid

belongs_to :bid, :class_name => Business, :foreign_key => :bid




end
