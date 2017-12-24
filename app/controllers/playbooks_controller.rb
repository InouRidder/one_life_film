class PlaybooksController < ApplicationController
  layout 'client'

  def show
    @playbook = Playbook.find(params[:id])
    @playline = Playline.new
  end

end
