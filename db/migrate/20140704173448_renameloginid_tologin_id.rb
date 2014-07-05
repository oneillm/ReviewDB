class RenameloginidTologinId < ActiveRecord::Migration
  def change
    rename_column :socialmediasites, :loginid, :login_id
  end
end
