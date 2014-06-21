class CreateSocialmediasites < ActiveRecord::Migration
  def change
    create_table :socialmediasites, id:false  do |t|
      t.primary_key :ssid
      t.string :ssname
      t.string :ssurl
      t.string :ssurlquery
      t.string :ssaccesstoken
      t.string :ssaccesstokensecretkey
      t.string :ssconsumerkey
      t.string :ssconsumersecret
      t.string :status
      t.integer :userid

      t.timestamps
    end
  end
end
