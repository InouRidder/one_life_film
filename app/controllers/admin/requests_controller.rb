class Admin::RequestsController < Admin::AdminController
  before_action :set_request, only: [:show, :update_state, :destroy, :approve]
  skip_before_action :set_counts, only: [:update_state, :approve, :destroy, :cancelled_requests]

  def show
    @request = @request.decorate
    @comment = Comment.new
  end

  def index
    @requests = Request.active.order(created_at: :desc).decorate
    @title = 'Actieve Aanvragen'
    respond_to do |format|
      format.html
      format.js { render 'insert_requests' }
    end
  end

  def new_arrivals
    @title = 'Nieuwe Aanvragen'
    @requests = Request.new_arrivals.order(date_wedding: :asc).decorate
    render 'insert_requests'
  end

  def cancelled_requests
    @title = 'Cancels'
    @cancellation = true
    @requests = Request.cancels.order(date_wedding: :asc).decorate
    render 'insert_cancellations'
  end

  def update_state
    #  TODO fix wedding date being saved upon creation of booking
    @request.update_state(params[:new_state])
    @request.save
    @request = @request.decorate
    render 'update_state'
  end

  def approve
    @request.update_state("approved")
    if @request.save && @request.approved?
      booking = Booking.new(@request.transferrable_attributes)
      booking.save
      redirect_to admin_bookings_path
    else
      redirect_to admin_requests_path
      flash[:notice] = "Could not approve booking"
    end
  end

  def destroy
    @request.decline
    @request.save
    redirect_to admin_requests_path
  end

  private

  def set_request
    @request = Request.find(params[:id])
  end


end
