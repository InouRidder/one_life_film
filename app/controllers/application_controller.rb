class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :set_locale


  def set_locale
    I18n.locale = params.fetch(:locale, I18n.default_locale).to_sym
  end

  def default_url_options
    { locale: I18n.locale == I18n.default_locale ? nil : I18n.locale }
  end

end








def BookingsController
  def create
    @booking = Booking.new(booking_params)
    @booking.start_datetime = DateTime.parse("#{booking_params[:start_date]} #{booking_params[:start_time]}")
    @booking.save
  end

  private

  def booking_params
    params.require(:booking).permit(:start_time, :start_date, :capacity, :price)
  end
end
