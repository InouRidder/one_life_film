class BookingMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.request_mailer.received.subject
  #
  def approved(booking)
    @booking = booking
    mail(to: booking.email_address, subject: "Booking approved by OneLife")
  end

  def reminder(booking)
    @booking = booking
    mail(to: booking.email_address, subject: "We need more information! Your wedding is in #{booking.days_till_wedding} days")
  end
end
