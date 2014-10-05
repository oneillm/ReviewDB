class AddPostingUrlToSscommentordata < ActiveRecord::Migration
  def change
    add_column :sscommentordata, :postingURL, :string
    add_column :ssdmappings, :postingURL, :string
  end
end
