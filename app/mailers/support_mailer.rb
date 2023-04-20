class SupportMailer < ApplicationMailer
  default from: 'noreply@example.com'

  def support_request_email(support_request)
    @support_request = support_request
    mail(to: 'downsjosseph@gmail.com', subject: 'New Support Request')
  end
end
