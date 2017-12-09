class PlaybooksController < ApplicationController
  def show
    @playbook = Playbook.find(params[:id])
    @playline = Playline.new
  end
end
