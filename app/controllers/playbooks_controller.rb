class PlaybooksController < ApplicationController
  before_action :set_playbook
  before_action :set_counts

  layout 'client'

  def show
    @times = Playline::TIMES
    @booking = @playbook.booking
    @playline = Playline.new
    unless current_user.playbook == @playbook || current_user.admin
      redirect_to root_path
      flash[:alert] = "No access"
    end
  end

  def songs
    @selection = Song.all
    @song_choice = SongChoice.new(playbook: @playbook)
    @songs = @playbook.song_choices
  end

  def film
    @film = @booking.film
    @film_id = @film.video_url.match(/\d+\z/)[0]
  end

  private

  def set_playbook
    @playbook = Playbook.find(params[:id]).decorate
    @booking = @playbook.booking
  end

  def set_counts
    p_count = @playbook.playlines.count
    @count = p_count > 0 ? p_count : ""
    m_count = @playbook.song_choices.count
    @music_count = m_count > 0 ? m_count : ""
  end

end



