class PlaybooksController < ApplicationController
  layout 'client'

  def show
    @playbook = Playbook.find(params[:id])
    @playline = Playline.new
    redirect_to root_path unless current_user.playbook == @playbook || current_user.admin
  end

  def songs
    @playbook = Playbook.find(params[:id])
  end


end
