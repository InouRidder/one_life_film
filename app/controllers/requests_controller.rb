class RequestsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :new, :create]
  before_action :set_request, only: [:send_reminder, :update]
  def new
    @request = Request.new
  end

  def create
    @request = Request.new(request_params)
    binding.pry
    if @request.save
      flash[:notice] = "We will address your request shortly"
      RequestMailer.received(@request).deliver_now
      redirect_to root_path
    else
      flash[:alert] = "Please review the errors below"
      render :new
    end
  end

  private

  def set_request
    @request = Request.find(params[:id])
  end

  def request_params
    params.require(:request).permit(:phone_number, :date_wedding, :location_wedding, :names, :email_address, :subject, :message)
  end

end
