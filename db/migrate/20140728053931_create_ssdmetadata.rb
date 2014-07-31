class CreateSsdmetadata < ActiveRecord::Migration
  def change
    create_table :ssdmetadata, id:false do |t|
      t.primary_key :ssdmetaid
      t.integer :ssid
      t.integer :bid
      t.string :ssdtotalreview
      t.string :ssdoverallrating
      t.timestamp :ssddownloaddatetimestamp

      t.timestamps
    end
  end
end
