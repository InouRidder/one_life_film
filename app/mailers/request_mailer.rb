class RequestMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.request_mailer.received.subject
  #

  def received(request)
    client = Postmark::ApiClient.new(ENV['POSTMARK_API_KEY'])
    client.mail(to: to: "inouridder@gmail.com", subject: request)
  end

end
