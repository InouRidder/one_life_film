class Admin::BookingsController < Admin::AdminController
  before_action :set_booking, only: [:update, :edit, :destroy, :approve, :show, :update_state]

  def index
    if query = params[:search]
      @title = 'Zoekresultaten'
      @search = true
      @bookings = Booking.search_by_name_and_location_wedding(query).order(created_at: :desc).decorate
      @events_per_day = {}
      @bookings.each do |booking|
        @events_per_day[booking.date_wedding] ? @events_per_day[booking.date_wedding][:bookings]<< booking : @events_per_day[booking.date_wedding] = {bookings: [booking] , requests: []}
      end
    else
      @months = Date::MONTHNAMES.compact
      @month = params[:month] || @months[Date.today.month - 1]
      @year = params[:year] || Date.today.year
      @years = (2016..2028).to_a
      @bookings = Booking.by_month("#{@month} #{@year}").decorate
      @requests = Request.by_month("#{@month} #{@year}").where("state != 'declined'").decorate
      @events_per_day = {}
      @bookings.each do |booking|
        @events_per_day[booking.date_wedding] ? @events_per_day[booking.date_wedding][:bookings]<< booking : @events_per_day[booking.date_wedding] = {bookings: [booking] , requests: []}
      end
      @requests.each do |request|
        @events_per_day[request.date_wedding] ? @events_per_day[request.date_wedding][:requests] << request : @events_per_day[request.date_wedding] = {bookings: [], requests: [request]}
      end
      @events_per_day = @events_per_day.sort.to_h
      respond_to do |format|
        format.html
        format.js {render 'insert_bookings', events_per_day: @events_per_day, title: @month, year: @year }
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
    @booking.update_state(params[:new_state])
    @booking.save
    @booking = @booking.decorate
    render 'update_state'
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
