class Admin::BookingsController < Admin::AdminController
  before_action :set_booking, only: [:update, :edit, :destroy, :approve, :show]

  def index
    @bookings = Booking.all
  end

  def new
    @booking = Booking.new
  end

  def show
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      flash[:notice] = "We will address your request shortly"
      redirect_to admin_booking_path(@booking)
    else
      flash[:alert] = "Please review the errors below"
      render :new
    end
  end

  def edit
  end

  def update
   @booking.update(booking_params)
    if @booking.save
      flash[:notice] = "We will address your request shortly"
      redirect_to admin_booking_path(@booking)
    else
      flash[:alert] = "Please review the errors below"
      render :new
    end
  end

  def destroy
    @booking.destroy
    redirect_to admin_bookings_path
  end

  def requests
    @requests = Booking.where(status: 'pending')
  end

  def approve
    #  TODO fix wedding date being saved upon creation of booking
    # if @booking.approve
      BookingServices.new(@booking).approve
      redirect_to admin_bookings_path
    # end
  end



private

  def set_booking
    @booking = Booking.find(params[:id])
  end


  def booking_params
    params.require(:booking).permit(:phone_number, :date_wedding, :location_wedding, :name, :email_address, :subject, :description)
  end

end
