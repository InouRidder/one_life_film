class Admin::BookingsController < Admin::AdminController
  before_action :set_booking, only: [:update, :edit, :destroy, :approve, :show, :update_state]
  skip_before_action :set_counts, only: [:create, :update, :update_state, :destroy, :all_bookings, :send_reminder]

  def index
    if query = params[:search] || params[:search_date]
      @title = 'Zoekresultaten'
      @search = true
      @bookings = params[:search] ? Booking.search_by_text(query) : Booking.by_day(Date.parse(query))
      @bookings = @bookings.order(created_at: :desc).decorate
    else
      @bookings = Booking.active.page(params[:page]).decorate
      @paginated = true
      @title = "Actieve bookingen"
      respond_to do |format|
        format.html
        format.js {render 'insert_bookings', bookings: @bookings, title: @title }
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

  def all_bookings
    @paginated = true
    @bookings = Booking.page(params[:page]).decorate
    @title = 'Alle boekingen'
    render 'insert_bookings'
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
