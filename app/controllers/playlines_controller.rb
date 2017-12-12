class PlaylinesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:set_order]
  skip_before_action :verify_authenticity_token, only: [:set_order]
  before_action :set_playbook, only: [:create]
  before_action :set_playline, except: [:create]
  def create
    @playline = Playline.new(playline_params)
    @playline.playbook = @playbook
    if @playline.save
      respond_to do |format|
        format.html { redirect_to playbook_path(@playbook) }
        format.js
      end
    else
      respond_to do |format|
        format.html { render 'playbooks/show' }
        format.js
      end
    end
  end

  def edit
    respond_to do |format|
      format.js
    end
  end
  # CAN ONLY EDIT ONE AT THE TIME!

  def update
    @playline.update(playline_params)
    @playbook = @playline.playbook
    if @playline.save
      respond_to do |format|
        format.html { redirect_to playbook_path(@playbook) }
        format.js
      end
    else
      respond_to do |format|
        format.html { render 'playbooks/show' }
        format.js
      end
    end
  end

  def set_order
    p @playline
    @playline.order_number = params[:order_number]
    @playline.save
  end

  def destroy
    playbook = @playline.playbook
    @playline.destroy
    respond_to do |format|
      format.html {redirect_to playbook_path(playbook)}
      format.js
    end
  end

  private

  def set_playline
    @playline = Playline.find(params[:id])
  end


  def set_playbook
    @playbook = Playbook.find(params[:playbook_id])
  end

  def playline_params
    params.require(:playline).permit(:begin_time, :end_time, :content, :location)
  end
end
