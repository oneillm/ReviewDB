class AddSearchbyToSocialmediasite < ActiveRecord::Migration
  def change
    add_column :socialmediasites, :searchby, :string
  end
end
