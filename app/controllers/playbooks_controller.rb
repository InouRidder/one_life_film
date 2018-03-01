class PlaybooksController < ApplicationController
  before_action :set_playbook
  before_action :set_counts

  layout 'client'

  def show
    @times = Playline::TIMES

    @playline = Playline.new
    redirect_to root_path unless current_user.playbook == @playbook || current_user.admin
  end

  def songs
    @selection = Song.all
    @song_choice = SongChoice.new(playbook: @playbook)
    @songs = @playbook.song_choices
  end

  private

  def set_playbook
    @playbook = Playbook.find(params[:id])
  end

  def set_counts
    p_count = @playbook.playlines.count
    @count = p_count > 0 ? p_count : ""
    m_count = @playbook.song_choices.count
    @music_count = m_count > 0 ? m_count : ""
  end

end



