class DeviseCreateLogins < ActiveRecord::Migration
	set_table_name "logins"
        set_primary_key :userid
end
