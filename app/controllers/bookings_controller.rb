class BookingsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :new, :create ]

  def new
    @booking = Booking.new
  end


  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      flash[:notice] = "We will address your request shortly"
      redirect_to root_path
    else
      flash[:alert] = "Please review the errors below"
      render :new
    end
  end

  def destroy
  end

  private

  def booking_params
    params.require(:booking).permit(:phone_number, :date_wedding, :location_wedding, :name, :email_address, :subject, :description)
  end

end
