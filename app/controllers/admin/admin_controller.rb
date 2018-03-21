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
    @rt_requests = Booking.rt_requests
    @rt_invoices = Booking.rt_invoices
    @rt_cancels = Booking.rt_cancels
    @rt_bookings = Booking.rt_bookings
  end

end
