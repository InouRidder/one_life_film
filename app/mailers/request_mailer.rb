class RequestMailer < ApplicationMailer
  def received(request)
    @request = request
    mail(to: 'info@onelifefilm.nl', subject: "Nieuwe aanvraag")
    mail(to: request.email_address, subject: "Aanvraag ontvangen")
  end
end
