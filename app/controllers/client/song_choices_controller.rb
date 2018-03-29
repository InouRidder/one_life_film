class Client::SongChoicesController < ApplicationController
  before_action :set_booking, only: [:create, :destroy]
  before_action :set_song_choice, only: [:destroy]

  def create
    @song_choice = SongChoice.new(song_choice_params)
    @song_choice.booking = @booking
    if @song_choice.save
      respond_to do |format|
        format.html {redirect_to songs_client_booking_path(@booking)}
        format.js
      end
    else
      respond_to do |format|
        format.html {render 'client/bookings/songs'}
        format.js
      end
    end
  end

  def destroy
    @song_choice.destroy
  end

private

  def song_choice_params
    params.require(:song_choice).permit(:title, :artist, :song_id)
  end

  def set_booking
    @booking = Booking.find(params[:booking_id])
  end

  def set_song_choice
    @song_choice = SongChoice.find(params[:id])
  end
end
