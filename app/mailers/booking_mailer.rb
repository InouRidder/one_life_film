class BookingMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.request_mailer.received.subject
  #

  def received(booking)
    @booking = booking

    mail(to: 'info@onelifefilm.nl', subject: "Nieuwe aanvraag")
    mail(to: booking.email_address, subject: "Request received by OneLife")
  end

  def approved(booking)
    @booking = booking
    mail(to: booking.email_address, subject: "Booking approved by OneLife")
  end
end
