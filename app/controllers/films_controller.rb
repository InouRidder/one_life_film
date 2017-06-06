class FilmsController < ApplicationController
  before_action :set_film, only: [:edit, :update, :destroy, :password]
  skip_before_action :authenticate_user!, only: [ :show, :password ]


  def index
    @films = Film.all
  end

  def show
    @film = Film.friendly.find(params[:id])
    if @film.password && session[:session_access].nil? && @film.password != ""
      redirect_to password_path(id: @film.id)
    end
    session.delete(:session_access)
  end

  def password
    if password = params[:password]
      if @film.password == password[:password]
        session[:session_access] = "access"
        redirect_to film_path(@film)
      else
        flash[:alert] = "Wrong Password"
      end
    end
  end

  def new
    @film = Film.new
  end

  def create
    @film = Film.new(film_params)
    @film.set_attributes
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
    @film.set_attributes
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
    params.require(:film).permit(:video_url, :name, :password, :promo)
  end

  def set_film
    @film = Film.find(params[:id]||params[:password][:film_id])
  end

end

