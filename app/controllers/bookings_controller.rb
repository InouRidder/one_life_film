class BookingsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :new, :create]
  before_action :set_booking, only: [:send_reminder, :update]
  def new
    @booking = Booking.new
  end

  def create
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
    params.require(:booking).permit(:phone_number, :date_wedding, :location_wedding, :name, :email_address, :subject, :description, :groom_number)
  end

end
