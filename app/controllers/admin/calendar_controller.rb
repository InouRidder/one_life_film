class Admin::CalendarController < Admin::AdminController

  def index
    if query = params[:search]
      @title = 'Zoekresultaten'
      @search = true
      @bookings = Booking.search_by_name_and_location_wedding(query).order(created_at: :desc).decorate
      @events_per_day = {}
      @bookings.each do |booking|
        @events_per_day[booking.date_wedding] ? @events_per_day[booking.date_wedding][:bookings]<< booking : @events_per_day[booking.date_wedding] = {bookings: [booking] , requests: []}
      end
    else
      @months = Date::MONTHNAMES.compact
      @month = params[:month] || @months[Date.today.month - 1]
      @year = params[:year] || Date.today.year
      @years = (2016..2028).to_a
      @bookings = Booking.by_month("#{@month} #{@year}").decorate
      @requests = Request.by_month("#{@month} #{@year}").where("state != 'declined'").decorate
      @events_per_day = {}
      @bookings.each do |booking|
        @events_per_day[booking.date_wedding] ? @events_per_day[booking.date_wedding][:bookings]<< booking : @events_per_day[booking.date_wedding] = {bookings: [booking] , requests: []}
      end
      @requests.each do |request|
        @events_per_day[request.date_wedding] ? @events_per_day[request.date_wedding][:requests] << request : @events_per_day[request.date_wedding] = {bookings: [], requests: [request]}
      end
      @events_per_day = @events_per_day.sort.to_h
      respond_to do |format|
        format.html
        format.js {render 'insert_events', events_per_day: @events_per_day, title: @month, year: @year }
      end
    end
  end

end
