class Admin::FilmsController < Admin::AdminController
  before_action :set_film, only: [:edit, :update, :destroy]

  def index
    @films = Film.all
  end

  def new
    @film = Film.new
  end

  def create
    @film = Film.new(film_params)
    if @film.save
      redirect_to admin_film_path(@film)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @film.update(film_params)
      redirect_to admin_film_path(@film)
    else
      render :edit
    end
  end

  def destroy
    @film.destroy
    redirect_to films_path
  end

  private

  def set_film
    @film = Film.find_by_slug(params[:id])
  end

  def film_params
    params.require(:film).permit(:password, :name, :video_url, :slug, :promo, :poster)
  end


end
