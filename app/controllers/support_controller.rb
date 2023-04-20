class SupportController < ApplicationController
  def new
    render({ :template => "support/new.html.erb" })
  end

  def create
    name = params[:name]
    email = params[:email]
    message = params[:message]

  
    redirect_to("/support", { :notice => "Your support request has been submitted." })
  end
end
