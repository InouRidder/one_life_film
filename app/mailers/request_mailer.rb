require 'mailgun'

class RequestMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.request_mailer.received.subject
  #

  def received(request)
    mg_client = Mailgun::Client.new(ENV['MAILGUN_API_KEY'])
    message_params = {:from    => ENV['ONELIFE_EMAIL'],
                      :to      => 'inouridder@gmail.com',
                      :subject => request.subject,
                      :text    => request.description

                    }
    mg_client.send_message ENV['MAILGUN_DOMAIN'], message_params
  end
end
