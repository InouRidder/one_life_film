class Admin::AdminController < ApplicationController
  before_action :authenticate_admin!

  private

  def authenticate_admin!
    unless current_user.admin
      flash[:alert] = "Only admin allowed access here"
      redirect_to root_path
    end
  end

end
