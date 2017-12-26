class Admin::BookingsController < Admin::AdminController
  before_action :set_booking, only: [:update, :edit, :destroy, :approve, :show]

  def index
    @bookings = Booking.approved.this_month
    @title = "Aankomende maand"
    respond_to do |format|
      format.html
      format.js {render 'insert_bookings', bookings: @bookings, title: @title }
    end
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
    @booking.decline
    @booking.save
    redirect_to admin_aanvragen_path
  end

  def requests
    @bookings = Booking.requests
    @title = 'Aanvragen'
    respond_to do |format|
      format.html
      format.js { render 'insert_bookings' }
    end
  end

  def old_requests
    @title = 'Oude aanragen'
    @bookings = Booking.old_requests
    render 'insert_bookings'
  end
# BOOKINGS!

  def this_week
    @bookings = Booking.approved.this_week
    @title = 'Deze week'
    render 'insert_bookings'
  end

  def old_bookings
    @bookings = Booking.approved.old
    @title ='Oude boekingen'
    render 'insert_bookings'
  end

  def all_bookings
    @bookings = Booking.approved
    @title = 'Alle boekingen'
    render 'insert_bookings'
  end

  def approve
    #  TODO fix wedding date being saved upon creation of booking
    if @booking.approve
      BookingServices.new(@booking).approve
      redirect_to admin_bookings_path
    end
  end



private

  def set_booking
    @booking = Booking.find(params[:id])
  end


  def booking_params
    params.require(:booking).permit(:phone_number, :date_wedding, :location_wedding, :name, :email_address, :subject, :description)
  end

end
