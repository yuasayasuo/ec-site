class EcSiteMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.ec_site_mailer.ragistration_mail.subject
  #
  def registration_mail(user, order)
    @user = user
    @order = order
    mail to: @user.email, subject: '注文完了のお知らせ'
  end
end
