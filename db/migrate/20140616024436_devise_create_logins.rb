class DeviseCreateLogins < ActiveRecord::Migration
	self.table_name = "logins"
        self.primary_key = "userid"
end
