class ReviewsController < ApplicationController

  def index
    matching_reviews = Review.all

    @list_of_reviews = matching_reviews.order({ :created_at => :desc })

    render({ :template => "reviews/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_reviews = Review.where({ :id => the_id })

    @the_review = matching_reviews.at(0)

    render({ :template => "reviews/show.html.erb" })
  end

  def create
    # Validate inputs
    if params[:query_stars].blank? || params[:query_date_occupancy].blank? || params[:query_date_vacancy].blank? || params[:query_text].blank? || params[:query_useful].blank? || params[:query_user_id].blank? || params[:query_city].blank? || params[:query_landlord_id].blank?
      redirect_to("/landlords/new", { :alert => "All input fields are required." })
      return
    end
  
    # Create new review with inputs
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
  
    # Save and redirect based on validation
    if the_review.valid?
      the_review.save
      redirect_to("/reviews", { :notice => "Review created successfully." })
    else
      redirect_to("/reviews", { :alert => the_review.errors.full_messages.to_sentence })
    end
  end
  
  def update
    the_id = params.fetch("path_id")
    the_review = Review.where({ :id => the_id }).at(0)
  
    the_review.stars = params.fetch("query_stars")
    the_review.date_occupancy = params.fetch("query_date_occupancy")
    the_review.text = params.fetch("query_text")
    the_review.useful = params.fetch("query_useful")
    the_review.landlord_id = params.fetch("query_landlord_id")
    the_review.user_id = params.fetch("query_user_id")
    the_review.city = params.fetch("query_city")
  
    # Check if any changes were made
    if the_review.changed?
      # Add additional validation checks
      if the_review.valid?
        the_review.save
        redirect_to("/reviews/#{the_review.id}", { :notice => "Review updated successfully."} )
      else
        redirect_to("/reviews/#{the_review.id}", { :alert => the_review.errors.full_messages.to_sentence })
      end
    else
      redirect_to("/reviews/#{the_review.id}", )
    end
  end
  

  def destroy
    the_id = params.fetch("path_id")
    the_review = Review.where({ :id => the_id }).at(0)

    the_review.destroy

    redirect_to("/reviews", { :notice => "Review deleted successfully."} )
  end
end
