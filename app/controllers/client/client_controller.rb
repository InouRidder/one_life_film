class Client::ClientController < ApplicationController
  # layout 'client'
  # before_action :set_booking

  # def set_booking
  #   @booking = Booking.find(params[:id]).decorate
  #   set_counts
  # end

  # def set_counts
  #   p_count = @booking.playlines.count
  #   @count = p_count > 0 ? p_count : ""
  #   m_count = @booking.song_choices.count
  #   @music_count = m_count > 0 ? m_count : ""
  # end

end
