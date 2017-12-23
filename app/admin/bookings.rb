ActiveAdmin.register Booking do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :phone_number, :date_wedding, :location_wedding, :name, :email_address, :subject, :description
#
# or
#

  form do |f|
    f.inputs "Booking Info" do
      f.input :phone_number
      f.input :email_address
      f.input :location_wedding
      f.input :subject
      f.input :description
      f.input :date_wedding
      f.input :status
    end
    f.actions
  end
end
