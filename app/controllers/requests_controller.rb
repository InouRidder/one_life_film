class RequestsController < ApplicationController

  def new
    @request = Request.new
  end


  def create
    @request = Request.new(request_params)
    if @request.save
      redirect_to root_path
      flash[:notice] = "We will address your request shortly"
      RequestMailer.received(@request).deliver_now
    else
      render :new
    end
  end

  def destroy
  end

  private

  def request_params
    params.require(:request).permit(:phonenumber, :location_wedding, :name, :concerns, :emailaddress, :date_wedding, :subject, :description)
  end

end
