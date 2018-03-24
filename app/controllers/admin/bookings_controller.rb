class Admin::BookingsController < Admin::AdminController
  before_action :set_booking, only: [:update, :edit, :destroy, :approve, :show, :update_state]

  def index
    if query = params[:search]
      @title = 'Zoekresultaten'
      @search = true
      @bookings = Booking.search_by_name_and_location_wedding(query).order(created_at: :desc).decorate
    else
      @months = Date::MONTHNAMES.compact
      @month = params[:month] || @months[Date.today.month - 1]
      @year = params[:year] || Date.today.year
      @years = (2016..2028).to_a
      @bookings = Booking.by_month("#{@month} #{@year}").decorate
      @bookings_per_day = {}
      @bookings.each do |booking|
        @bookings_per_day[booking.date_wedding] ? @bookings_per_day[booking.date_wedding] << booking : @bookings_per_day[booking.date_wedding] = [booking]
      end
      respond_to do |format|
        format.html
        format.js {render 'insert_bookings', bookings_per_day: @bookings_per_day, title: @month, year: @year }
      end
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

  def update_state
    #  TODO fix wedding date being saved upon creation of booking
    @booking.update_state(params[:new_state])

    if @booking.save
      redirect_to admin_bookings_path(month: @booking.date_wedding.strftime("%B"), year: @booking.date_wedding.year )
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
