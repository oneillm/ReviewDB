# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20141003060903) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "businesses", primary_key: "bid", force: true do |t|
    t.string   "bname"
    t.string   "btype"
    t.string   "blatitude"
    t.string   "blongitude"
    t.string   "bstreet"
    t.string   "bcity"
    t.string   "bstate"
    t.string   "bzip"
    t.string   "bcountry"
    t.string   "bstatus"
    t.string   "bshortname"
    t.string   "bphone",     array: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "logins", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "username",               default: "", null: false
    t.string   "firstname"
    t.string   "lastname"
    t.string   "role"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "phone"
    t.string   "status"
    t.text     "selectedsites",                                    array: true
  end

  create_table "socialmediasites", primary_key: "ssid", force: true do |t|
    t.string   "ssname"
    t.string   "ssurl"
    t.string   "ssurlquery"
    t.string   "ssaccesstoken"
    t.string   "ssaccesstokensecretkey"
    t.string   "ssconsumerkey"
    t.string   "ssconsumersecret"
    t.string   "status"
    t.integer  "login_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "sssearchby"
  end

  create_table "sscommentordata", primary_key: "ssdid", force: true do |t|
    t.integer  "ssid"
    t.integer  "bid"
    t.string   "ssdcommentorid"
    t.string   "ssdcommentorname"
    t.string   "ssdcommentortimezone"
    t.string   "ssdpostingtimezone"
    t.string   "ssdcommentorlanguage"
    t.string   "ssdcommentorrating"
    t.text     "ssdcomment"
    t.string   "ssdpostat"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "ssdcommentorloc"
    t.string   "postingURL"
  end

  create_table "ssdmappings", primary_key: "mappingid", force: true do |t|
    t.integer  "ssid"
    t.string   "ssdcommentorid"
    t.string   "ssdcommentorname"
    t.string   "ssdcommentortimezone"
    t.string   "ssdpostingtimezone"
    t.string   "ssdcommentorlanguage"
    t.string   "ssdtotalreview"
    t.string   "ssdoverallrating"
    t.string   "ssdcommentorrating"
    t.string   "ssdcomment"
    t.string   "ssdpostat"
    t.string   "ssdcommentorloc"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "postingURL"
  end

  create_table "ssdmetadata", primary_key: "ssdmetaid", force: true do |t|
    t.integer  "ssid"
    t.integer  "bid"
    t.string   "ssdtotalreview"
    t.string   "ssdoverallrating"
    t.datetime "ssddownloaddatetimestamp"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
