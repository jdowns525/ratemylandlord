class SupportController < ApplicationController
  def new
    render({ :template => "support/new.html.erb" })
  end

  def create
    name = params[:name]
    email = params[:email]
    message = params[:message]
  
    
    support_request = SupportRequest.new(name: name, email: email, message: message)
  
    if support_request.save
      
      SupportMailer.support_request_email(support_request).deliver_now
  
      redirect_to("/support", { :notice => "Your support request has been submitted." })
    else
      redirect_to("/support", { :alert => support_request.errors.full_messages.to_sentence })
    end
  end
  
end
