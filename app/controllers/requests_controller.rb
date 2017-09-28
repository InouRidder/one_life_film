class RequestsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :new, :create ]

  def new
    @request = Request.new
  end


  def create
    raise
    @request = Request.new(request_params)
    if @request.save
      redirect_to root_path
      flash[:notice] = "We will address your request shortly"
      RequestMailer.received(@request).deliver_now
    else
      render :new
      flash[:alert] = "Please review the errors below"
    end
  end

  def destroy
  end

  private

  def request_params
    params.require(:request).permit(:phone_number, :date_wedding, :location_wedding, :name, :email_address, :subject, :description)
  end

end
