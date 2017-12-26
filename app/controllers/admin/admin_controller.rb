class Admin::AdminController < ApplicationController
  before_action :authenticate_admin!
  layout 'admin'

  private

  def authenticate_admin!
    unless current_user.admin
      flash[:alert] = "Sorry no access!"
      redirect_to root_path
    end
  end

end
