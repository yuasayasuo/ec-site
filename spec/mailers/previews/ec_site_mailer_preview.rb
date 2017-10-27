# Preview all emails at http://localhost:3000/rails/mailers/ec_site_mailer
class EcSiteMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/ec_site_mailer/ragistration_mail
  def ragistration_mail
    EcSiteMailerMailer.ragistration_mail
  end

end
