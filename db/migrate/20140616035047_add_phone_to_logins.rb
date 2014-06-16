class AddPhoneToLogins < ActiveRecord::Migration
  def change
    add_column :logins, :phone, :string
  end
end
