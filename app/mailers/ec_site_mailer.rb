class EcSiteMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.ec_site_mailer.ragistration_mail.subject
  #
  def ragistration_mail
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
