class CreateSsdmappings < ActiveRecord::Migration
  def change
    create_table :ssdmappings,id:false  do |t|
      t.primary_key :mappingid
      t.integer :ssid
      t.string :ssdcommentorid
      t.string :ssdcommentorname
      t.string :ssdcommentortimezone
      t.string :ssdpostingtimezone
      t.string :ssdcommentorlanguage
      t.string :ssdtotalreview
      t.string :ssdoverallrating
      t.string :ssdcommentorrating
      t.string :ssdcomment
      t.string :ssdpostat
      t.string :ssdcommentorloc
      t.string :postingurl
      t.timestamps
    end
  end
end
