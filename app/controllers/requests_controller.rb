class BookingsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :new, :create ]

  def new
    @booking = Request.new
  end


  def create
    raise
    @booking = Booking.new(booking_params)
    if @booking.save
      redirect_to root_path
      flash[:notice] = "We will address your request shortly"
    else
      render :new
      flash[:alert] = "Please review the errors below"
    end
  end

  def destroy
  end

  private

  def booking_params
    params.require(:booking).permit(:phone_number, :date_wedding, :location_wedding, :name, :email_address, :subject, :description)
  end

end
