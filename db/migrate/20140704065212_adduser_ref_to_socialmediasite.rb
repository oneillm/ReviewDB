class AdduserRefToSocialmediasite < ActiveRecord::Migration
  def change
      add_reference :socialmediasites, :userid, index: true

  end
end
