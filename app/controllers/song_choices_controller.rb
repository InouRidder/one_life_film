class SongChoicesController < ApplicationController
  before_action :set_playbook, only: [:create, :destroy]
  before_action :set_song_choice, only: [:destroy]
  def create
    @song_choice = SongChoice.new(song_choice_params)
    @song_choice.playbook = @playbook
    if @song_choice.save
      respond_to do |format|
        format.html {redirect_to songs_playbook_path(@playbook)}
        format.js
      end
    else
      respond_to do |format|
        format.html {render 'playbooks/songs'}
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

  def set_playbook
    @playbook = Playbook.find(params[:playbook_id])
  end

  def set_song_choice
    @song_choice = SongChoice.find(params[:id])
  end
end
