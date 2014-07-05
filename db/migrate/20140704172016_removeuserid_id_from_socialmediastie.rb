class RemoveuseridIdFromSocialmediastie < ActiveRecord::Migration
  def self.up
    remove_column :socialmediasites, :userid_id

  end
end
