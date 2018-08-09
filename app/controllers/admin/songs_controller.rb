class Admin::SongsController < Admin::AdminController
  before_action :set_song, only: [:edit, :update, :destroy]

  def index
    if query = params[:search]
      @search = true
      @songs = Song.search_by_title_and_artist(query)
    else
      @songs = Song.page(params[:page])
      respond_to do |format|
        format.html
        format.js {render 'insert_songs'}
      end
    end
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)
    if @song.save
      redirect_to admin_songs_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @song.update(song_params)
      redirect_to admin_songs_path
    else
      render :edit
    end
  end

  def destroy
    @song.destroy
    redirect_to admin_songs_path
  end

  def slow
    @title = "Slow temp"
    @songs = Song.slow.page(params[:page])
    render 'insert_songs'
  end

  def medium
    @title = "Med tempo"
    @songs = Song.medium.page(params[:page])
    render 'insert_songs'
  end

  def up
    @title = "Up tempo"
    @songs = Song.up.page(params[:page])
    render 'insert_songs'
  end

  private

  def set_song
    @song = Song.find(params[:id])
  end

  def song_params
    params.require(:song).permit(:name, :category_id, :url)
  end
end
