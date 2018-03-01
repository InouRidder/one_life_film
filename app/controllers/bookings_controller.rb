class BookingsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :new, :create ]
  before_action :set_booking, only: [:send_reminder]
  def new
    @booking = Booking.new
  end

  def create
    # TODO Booking wedding date not saved !
    @booking = Booking.new(booking_params)
    if @booking.save
      flash[:notice] = "We will address your request shortly"
      BookingMailer.received(@booking).deliver_now
      redirect_to root_path
    else
      flash[:alert] = "Please review the errors below"
      render :new
    end
  end

  def send_reminder
    BookingMailer.reminder(@booking).deliver_now
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:phone_number, :date_wedding, :location_wedding, :name, :email_address, :subject, :description)
  end

end
