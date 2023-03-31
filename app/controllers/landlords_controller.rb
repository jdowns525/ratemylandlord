class LandlordsController < ApplicationController
  def index
    matching_landlords = Landlord.all

    @list_of_landlords = matching_landlords.order({ :created_at => :desc })

    render({ :template => "landlords/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_landlords = Landlord.where({ :id => the_id })

    @the_landlord = matching_landlords.at(0)

    render({ :template => "landlords/show.html.erb" })
  end

  def create
    the_landlord = Landlord.new
    the_landlord.name = params.fetch("query_name")
    the_landlord.neighborhood = params.fetch("query_neighborhood")
    the_landlord.address = params.fetch("query_address")
    the_landlord.state = params.fetch("query_state")
    the_landlord.city = params.fetch("query_city")
    the_landlord.postal_code = params.fetch("query_postal_code")
    #the_landlord.latitude = params.fetch("query_latitude")
    #the_landlord.longitude = params.fetch("query_longitude")
    the_landlord.stars = params.fetch("query_stars")
    #the_landlord.caption = params.fetch("query_caption")
    #the_landlord.id = session.fetch(:user_id)

    if the_landlord.valid?
      the_landlord.save
      redirect_to("/landlords", { :notice => "Landlord created successfully." })
    else
      redirect_to("/landlords", { :alert => the_landlord.errors.full_messages.to_sentence })
    end
  end

  

  def update
    the_id = params.fetch("path_id")
    the_landlord = Landlord.where({ :id => the_id }).at(0)

    the_landlord.name = params.fetch("query_name")
    the_landlord.neighborhood = params.fetch("query_neighborhood")
    the_landlord.address = params.fetch("query_address")
    the_landlord.state = params.fetch("query_state")
    the_landlord.postal_code = params.fetch("query_postal_code")
    the_landlord.latitude = params.fetch("query_latitude")
    the_landlord.longitude = params.fetch("query_longitude")
    the_landlord.stars = params.fetch("query_stars")
    the_landlord.review_count = params.fetch("query_review_count")
    the_landlord.reviews_count = params.fetch("query_reviews_count")

    if the_landlord.valid?
      the_landlord.save
      redirect_to("/landlords/#{the_landlord.id}", { :notice => "Landlord updated successfully."} )
    else
      redirect_to("/landlords/#{the_landlord.id}", { :alert => the_landlord.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_landlord = Landlord.where({ :id => the_id }).at(0)

    the_landlord.destroy

    redirect_to("/landlords", { :notice => "Landlord deleted successfully."} )
  end
end
