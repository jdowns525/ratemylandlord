class LandlordsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :update, :destroy, :new, :edit]
  
  def index
    if params[:search].present?
      search_query = params[:search].downcase
      matching_landlords = Landlord.where("lower(name) LIKE ? OR lower(address) LIKE ? OR lower(neighborhood) LIKE ?", "%#{search_query}%", "%#{search_query}%", "%#{search_query}%")
  
      if matching_landlords.empty?
        flash.now[:alert] = "Landlord not available." unless @current_user
      end
  
    else
      matching_landlords = Landlord.all
    end
  
    @list_of_landlords = matching_landlords.order({ :created_at => :desc })
    @landlords = @list_of_landlords.paginate(page: params[:page], per_page: 5)
  
    render({ :template => "landlords/index.html.erb" })
  end
  
  

  def show
    the_id = params[:id]
    matching_landlords = Landlord.where({ :id => the_id })
    @the_landlord = matching_landlords.at(0)
  
    if @the_landlord.present?
      @reviews = @the_landlord.reviews.order({ :created_at => :desc })
      render({ :template => "landlords/show.html.erb" })
    else
      # Redirect to the main Landlords page with an error message
      flash[:error] = "Landlord not found."
      redirect_to landlords_path
    end
  end
  
  
  
  

  def create
    if params[:query_name].blank? || params[:query_neighborhood].blank? || params[:query_address].blank? || params[:query_state].blank? || params[:query_postal_code].blank?
      redirect_to("/landlords/new", { :alert => "All input fields are required." })
      return
    end
  
    the_landlord = Landlord.new
    the_landlord.name = params.fetch("query_name")
    the_landlord.neighborhood = params.fetch("query_neighborhood")
    the_landlord.address = params.fetch("query_address")
    the_landlord.state = params.fetch("query_state")
    the_landlord.postal_code = params.fetch("query_postal_code")
    the_landlord.city = params.fetch("query_city")
    the_landlord.user_id = @current_user.id  # Assigning the current user as the landlord's creator
  
    if the_landlord.valid?
      the_landlord.save
      redirect_to("/landlords/#{the_landlord.id}", { :notice => "Landlord created successfully." })
    else
      redirect_to("/landlords/new", { :alert => the_landlord.errors.full_messages.to_sentence })
    end
  end
  
  def update
    the_id = params[:id]
    the_landlord = Landlord.where({ :id => the_id }).at(0)
  
    # Check if the current user is the one who created the landlord
    unless @current_user.id == the_landlord.user_id
      redirect_to("/landlords/#{the_landlord.id}", { :alert => "You are not authorized to edit this landlord." })
      return
    end
  
    the_landlord.name = params.fetch("query_name")
    the_landlord.neighborhood = params.fetch("query_neighborhood")
    the_landlord.address = params.fetch("query_address")
    the_landlord.state = params.fetch("query_state")
    the_landlord.postal_code = params.fetch("query_postal_code")
    the_landlord.city = params.fetch("query_city")
    the_landlord.stars = params.fetch("query_stars")
  
    if the_landlord.valid?
      the_landlord.save
      redirect_to("/landlords/#{the_landlord.id}", { :notice => "Landlord updated successfully."} )
    else
      redirect_to("/landlords/#{the_landlord.id}", { :alert => the_landlord.errors.full_messages.to_sentence })
    end
  end
  

  def destroy
    the_id = params[:id]
    the_landlord = Landlord.where({ :id => the_id }).at(0)
    the_landlord.destroy
    redirect_to("/landlords", { :notice => "Landlord deleted successfully."} )
  end

  def home
    if params[:search].present?
      search_query = params[:search].downcase
      matching_landlords = Landlord.where("lower(name) LIKE ?", "%#{search_query}%")
    else
      matching_landlords = Landlord.all
    end
  
    @list_of_landlords = matching_landlords.order({ :created_at => :desc })
    @landlords = @list_of_landlords.paginate(page: params[:page], per_page: 5)
    
    # Change this line to paginate the reviews
    @reviews = Review.order({ :created_at => :desc }).paginate(page: params[:page], per_page: 10)
  
    render({ :template => "landlords/home.html.erb" })
  end
  
  

  private

  def authenticate_user!
    unless @current_user
      redirect_to("/user_sign_in", { :alert => "You have to sign in first." })
    end
  end
end
