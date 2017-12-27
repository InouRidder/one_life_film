class Admin::SongsController < Admin::AdminController
  before_action :set_song, only: [:edit, :update, :destroy]

  def index
    if query = params[:search]
      @search = true
      @songs = Song.search_by_name(query)
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

  def begin
    @title = "Begin"
    @songs = Song.begin
    render 'insert_songs'
  end

  def middle
    @title = "Midden"
    @songs = Song.middle
    render 'insert_songs'
  end

  def end
    @title = "Einde"
    @songs = Song.end
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
