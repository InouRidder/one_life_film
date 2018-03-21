class Admin::AdminController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_counts
  layout 'admin'

  private

  def authenticate_admin!
    unless current_user.admin
      flash[:alert] = "Sorry no access!"
      redirect_to root_path
    end
  end

  def set_counts
    @rt_requests = Request.rt_requests
    @rt_quotations = Request.rt_quotations
    @rt_cancels = Request.rt_cancels
    @rt_bookings = Booking.active.count
  end

end
