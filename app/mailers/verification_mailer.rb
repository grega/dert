class VerificationMailer < ApplicationMailer
  default from: ENV.fetch('EMAIL_FROM')
 
  def verification_email
    @erasure_request = params[:erasure_request]
    @email_from = ENV.fetch('ORG_NAME')
    @site_domain = ENV.fetch('SITE_DOMAIN')
    @url = verify_erasure_request_url(:token => @erasure_request.verify_token)
    mail(to: @erasure_request.email, subject: "[#{ENV.fetch('ORG_NAME')}] Verify Action: Erase Personal Data")
  end
end
