class SupportMailer < ApplicationMailer
  default from: 'noreply@example.com'

  def support_request_email(support_request)
    puts "Sending support request email..."
    @support_request = support_request
    mail(to: 'mylandlordratings@gmail.com', subject: 'New Support Request')
  end
end
