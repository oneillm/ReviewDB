class CreateBusinesses < ActiveRecord::Migration
  def change
    create_table :businesses, id:false do |t|
      t.primary_key :bid
      t.string :bname
      t.string :btype
      t.string :blatitude
      t.string :blongitude
      t.string :bstreet
      t.string :bcity
      t.string :bstate
      t.string :bzip
      t.string :bcountry
      t.string :bstatus
      t.string :bshortname
      t.string :bphone, array:true

      t.timestamps
    end
  end
end
