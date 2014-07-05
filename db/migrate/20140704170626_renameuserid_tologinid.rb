class RenameuseridTologinid < ActiveRecord::Migration
  def change
	rename_column :socialmediasites, :userid, :loginid
        

  end
  def self.up
       remove_column :socialmediasites, :userid_id
  end
end
