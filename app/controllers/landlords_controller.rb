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
  
    # Query for reviews associated with the landlord
    @reviews = @the_landlord.reviews.order({ :created_at => :desc })
  
    render({ :template => "landlords/show.html.erb" })
  end
  

  def create
    the_review = Review.new
    the_review.stars = params.fetch("query_stars")
    the_review.date_occupancy = params.fetch("query_date_occupancy")
    the_review.date_vacancy = params.fetch("query_date_vacancy")
    the_review.text = params.fetch("query_text")
    the_review.useful = params.fetch("query_useful")
    the_review.user_id = params.fetch("query_user_id")
    the_review.city = params.fetch("query_city")
    
    # Associate the review with a landlord
    the_landlord = Landlord.find(params.fetch("query_landlord_id"))
    the_review.landlord = the_landlord
  
    if the_review.valid?
      the_review.save
      redirect_to("/reviews", { :notice => "Review created successfully." })
    else
      redirect_to("/reviews", { :alert => the_review.errors.full_messages.to_sentence })
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
