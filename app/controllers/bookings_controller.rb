class BookingsController < ApplicationController
  before_action :set_booking

  def update
    if @booking.update(booking_params)
      redirect_to playbook_path(@booking.playbook)
      flash[:notice] = "Checklist updated!"
    else
      render 'playbooks/show'
    end
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:phone_number, :date_wedding, :location_wedding, :names, :email_address, :subject, :message)
  end
end
