class PlaybooksController < ApplicationController
  before_action :set_playbook
  layout 'client'

  def show
    @playline = Playline.new
    redirect_to root_path unless current_user.playbook == @playbook || current_user.admin
  end

  def songs
    @song_choice = SongChoice.new(playbook: @playbook)
    @songs = @playbook.song_choices
  end

  private

  def set_playbook
    @playbook = Playbook.find(params[:id])
  end
end
