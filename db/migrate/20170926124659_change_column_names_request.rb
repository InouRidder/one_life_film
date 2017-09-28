class ChangeColumnNamesRequest < ActiveRecord::Migration[5.1]
  def change
    rename_column :requests, :emailaddress, :email_address
    rename_column :requests, :phonenumber, :phone_number
  end
end
