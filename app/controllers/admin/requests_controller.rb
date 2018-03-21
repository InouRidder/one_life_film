class Admin::RequestsController < Admin::AdminController
  before_action :set_request, only: [:show, :update_state, :destroy, :approve]
  skip_before_action :set_counts, only: [:update_state, :approve, :destroy, :cancelled_requests]
  def show
  end

  def index
    @requests = Booking.requests.active
    @title = 'Aanvragen'
    respond_to do |format|
      format.html
      format.js { render 'insert_requests' }
    end
  end

  def cancelled_requests
    @title = 'Cancels'
    @cancellation = true
    @requests = Booking.cancels
    render 'insert_cancellations'
  end

  def update_state
    #  TODO fix wedding date being saved upon creation of booking
    @request.update_state(params[:new_state])
    if @request.save
      BookingServices.new(@request).approve if @request.approved?
      redirect_to admin_requests_path
    end
  end

  def approve
    @request.approve
    @request.save
    redirect_to admin_bookings_path
  end

  def destroy
    @request.decline
    @request.save
    redirect_to admin_requests_path
  end

  private

  def set_request
    @request = Booking.find(params[:id])
  end


end
