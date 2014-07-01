class AddStatusToLogins < ActiveRecord::Migration
  def change
    add_column :logins, :status, :string
  end
end
