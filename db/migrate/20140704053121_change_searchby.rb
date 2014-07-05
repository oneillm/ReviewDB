class ChangeSearchby < ActiveRecord::Migration
  def change
     rename_column :socialmediasites, :searchby, :sssearchby


  end
end
