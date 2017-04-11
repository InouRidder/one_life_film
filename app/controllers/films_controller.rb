class FilmsController < ApplicationController
  before_action :set_film, only: [:show, :edit, :update, :destroy]

  def index
    @films = Film.all
  end

  def show
    if @film.password && params[:password] != @film.password
      redirect_to password_page(@film)
    else
      render :show
    end
  end

  def new
    @film = Film.new
  end

  def create
    @film = Film.new(film_params)
    if @film.save
      redirect_to film_path(@film)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @film.update(film_params)
    if @film.save
      redirect_to film_path(@film)
    else
      render :new
    end
  end

  def destroy
    @film.destroy
    redirect_to films_path
  end

  private

  def film_params
    params.require(:film).permit(:video_url, :name, :slug, :password)
  end

  def set_film
    @film = Film.find(params[:id])
  end

end
