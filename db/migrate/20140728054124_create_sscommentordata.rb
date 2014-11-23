class CreateSscommentordata < ActiveRecord::Migration
  def change
    create_table :sscommentordata, id:false do |t|
      t.primary_key :ssdid
      t.integer :ssid, :null => :no
      t.integer :bid, :null => :no
      t.string :ssdcommentorid
      t.string :ssdcommentorname
      t.string :ssdcommentortimezone
      t.string :ssdpostingtimezone
      t.string :ssdcommentorlanguage
      t.string :ssdcommentorrating
      t.text  :ssdcomment
      t.string :ssdpostat
      t.timestamps :ssddownloaddatetimestamp
      t.string :ssdcommentorloc
      t.string :postingurl
      t.date :ssdconvertedpostat
      t.timestamps
    end
  end
end
