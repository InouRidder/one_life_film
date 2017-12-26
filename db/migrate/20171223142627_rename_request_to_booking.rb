class RenameRequestToBooking < ActiveRecord::Migration[5.1]
  def change
    remove_reference :playbooks, :booking, index: true
    drop_table :bookings
    rename_table :requests, :bookings
    add_reference :playbooks, :booking, index: true
  end
end
