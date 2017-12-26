class BookingServices
  def initialize(booking)
    @booking = booking
  end

  def approve
    user = User.find_or_create(@booking.email_address)
    playbook = Playbook.create(booking: @booking)
    playbook.save
    user.save
    @booking.user = user
    @booking.save
    BookingMailer.approved(@booking).deliver_now
  end

end
