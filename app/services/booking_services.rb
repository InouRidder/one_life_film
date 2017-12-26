class BookingServices
  def initialize(booking)
    @booking = booking
  end

  def approve
    user = User.new(email: @booking.email_address, password: "123#{@booking.email_address}")
    user.save
    @booking.user = user
    playbook = Playbook.create(booking: @booking)
    playbook.save
    @booking.save
    BookingMailer.approved(@booking).deliver_now
  end

end
