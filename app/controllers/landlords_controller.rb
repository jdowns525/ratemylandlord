class LandlordsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :update, :destroy, :new, :edit]

  def index
    if params[:search].present?
      search_query = params[:search].downcase
      matching_landlords = Landlord.where("lower(name) LIKE ? OR lower(address) LIKE ? OR lower(neighborhood) LIKE ?", "%#{search_query}%", "%#{search_query}%", "%#{search_query}%")
  
      flash.now[:alert] = "Landlord not available." unless matching_landlords.exists?
    else
      matching_landlords = Landlord.all
    end
  
    @list_of_landlords = matching_landlords.order(created_at: :desc).paginate(page: params[:page], per_page: 5)
    @landlords = @list_of_landlords || [] # Set @landlords to an empty array if matching_landlords is nil
  
    render template: "landlords/index.html.erb"
  end
  

  def show
    @the_landlord = Landlord.find_by(id: params[:id])

    if @the_landlord
      @reviews = @the_landlord.reviews.order(created_at: :desc)
      render template: "landlords/show.html.erb"
    else
      flash[:error] = "Landlord not found."
      redirect_to landlords_path
    end
  end

  def create
    the_landlord = Landlord.new(landlord_params)
    the_landlord.user_id = @current_user.id # Assigning the current user as the landlord's creator

    if the_landlord.save
      redirect_to landlord_path(the_landlord.id), notice: "Landlord created successfully."
    else
      redirect_to new_landlord_path, alert: the_landlord.errors.full_messages.to_sentence
    end
  end

  def update
    the_landlord = Landlord.find_by(id: params[:id])

    unless @current_user.id == the_landlord.user_id
      redirect_to landlord_path(the_landlord.id), alert: "You are not authorized to edit this landlord."
      return
    end

    if the_landlord.update(landlord_params)
      redirect_to landlord_path(the_landlord.id), notice: "Landlord updated successfully."
    else
      redirect_to landlord_path(the_landlord.id), alert: the_landlord.errors.full_messages.to_sentence
    end
  end

  def destroy
    the_landlord = Landlord.find_by(id: params[:id])
    the_landlord.destroy
    redirect_to landlords_path, notice: "Landlord deleted successfully."
  end

  def home
    if params[:search].present?
      search_query = params[:search].downcase
      matching_landlords = Landlord.where("lower(name) LIKE ?", "%#{search_query}%")
    else
      matching_landlords = Landlord.all
    end

    @list_of_landlords = matching_landlords.order(created_at: :desc).paginate(page: params[:page], per_page: 5)
    @reviews = Review.order(created_at: :desc).paginate(page: params[:page], per_page: 10)

    render template: "landlords/home.html.erb"
  end

  private

  def authenticate_user!
    redirect_to user_sign_in_path, alert: "You have to sign in first." unless @current_user
  end
end
