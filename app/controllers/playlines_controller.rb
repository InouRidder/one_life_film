class PlaylinesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:set_order, :update]
  skip_before_action :verify_authenticity_token, only: [:create, :update, :set_order]
  before_action :set_playbook, only: [:create]
  before_action :set_playline, except: [:create, :set_order]
  before_action :set_times, except: [:set_order, :destroy]

  def create
    @playline = Playline.new(playline_params)
    @playline.playbook = @playbook
    @times = Playline::TIMES
    @playline.set_order
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
    @times = Playline::TIMES
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
        format.json { @playine.to_json }
        format.js
      end
    else
      respond_to do |format|
        format.html { render 'playbooks/show' }
        format.json { @playine.to_json }
        format.js
      end
    end
  end

  def set_order
    new_order = params[:new_order]
    new_order.each do |key, value|
      playline = Playline.find(key)
      playline.order_number = value
      playline.save
    end
    # @playline.order_number = params[:order_number]
    # @playline.save
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

  def set_times
    @times = Playline::TIMES
  end

  def set_playline
    @playline = Playline.find(params[:id])
  end


  def set_playbook
    @playbook = Playbook.find(params[:playbook_id])
  end

  def set_order_params
    params.require(:new_order).permit(/\d/)
  end

  def playline_params
    params.require(:playline).permit(:begin_time, :end_time, :content, :city, :address, :contact, :phone_number)
  end
end
