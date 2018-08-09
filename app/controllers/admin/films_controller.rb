class Admin::FilmsController < Admin::AdminController
  before_action :set_film, only: [:edit, :update, :destroy, :show]

  def index
    if query = params[:search]
      @films = Film.search_by_name_and_slug(query).page(params[:page])
    elsif params[:promo]
      @films = Film.promos.page(params[:page])
    else
      @films = Film.page(params[:page])
    end

    respond_to do |format|
      format.html
      format.js {render 'insert_films', bookings: @films }
    end
  end

  def show
  end

  def new
    if id = params[:booking_id]
      @booking = Booking.find(id)
    end
    @film = Film.new
  end

  def create
    @film = Film.new(film_params)
    if @film.save
      if booking = @film.booking
        booking.filmed!
        booking.save
      end
      if booking
        redirect_to film_client_booking_path(booking)
      else
        redirect_to film_path(@film)
      end
    else
      render :new
    end
  end

  def edit
    @booking = false
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
    params.require(:film).permit(:password, :name, :video_url, :slug, :promo, :poster, :booking_id)
  end


end
