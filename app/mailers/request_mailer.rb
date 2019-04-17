class RequestMailer < ApplicationMailer
  def received(request)
    @request = request
    mail(to: request.email_address, subject: "Aanvraag ontvangen")
  end

  def notify_of_new_request(request)
    @request = request
    mail(to: 'info@onelifefilm.nl', subject: "Nieuwe aanvraag", template_name: 'received')
  end
end
