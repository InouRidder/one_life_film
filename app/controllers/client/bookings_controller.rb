class Client::BookingsController < ApplicationController
  layout 'client'
  before_action :set_booking

  def show
    if @booking.filmed?
      redirect_to film_playbook_path(@playbook)
    end
    @times = Playline::TIMES
    @playline = Playline.new
    unless current_user.booking == @booking || current_user.admin
      redirect_to root_path
      flash[:alert] = "No access"
    end
  end

  def songs
    @selection = Song.all
    @song_choice = SongChoice.new(booking: @booking)
    @songs = @booking.song_choices
  end

  def film
    @film = @booking.film
    @film_id = @film.vimeo_id
  end

  before_action :set_booking

  def update
    if @booking.update(booking_params)
      redirect_to client_booking_path(@booking)
      flash[:notice] = "Checklist updated!"
    else
      render 'client/bookings/show'
    end
  end

  private

  def set_booking
    @booking = Booking.find(params[:id]).decorate
    set_counts
  end

  def booking_params
    params.require(:booking).permit(:phone_number, :date_wedding, :location_wedding, :name, :email_address, :subject, :message, :groom_number)
  end

  def set_counts
    p_count = @booking.playlines.count
    @count = p_count > 0 ? p_count : ""
    m_count = @booking.song_choices.count
    @music_count = m_count > 0 ? m_count : ""
  end

end



