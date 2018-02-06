class BookingFormsController < ApplicationController

  def edit
    @bookings_form = BookingForm.find(params[:id])
    @form_line = FormLine.new
  end

  def update
  end

end
