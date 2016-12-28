class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :upvote, :downvote]
  before_action :authenticate_user!, only: [:show, :new, :edit, :update, :destroy]
  # before_filter :authenticate_user!, only: [:show, :new, :edit, :update, :destroy]

  def index
    if params[:query]
      @users = User.text_search(params[:query])
      # @users = Kaminari.paginate_array(@users).page(params[:page]).per(15)
      if params[:query].blank?
        @users = User.all
        # @users = Kaminari.paginate_array(@users).page(params[:page]).per(15)
      else
      end
    else
      @users = User.all 
      @employers = User.where("rel_status = ?", "employer")
      @profiles = User.where("rel_status = ?", "complete")
      # @users = User.where("deleted = ?", false)
      # @users = Kaminari.paginate_array(@users).page(params[:page]).per(15)
    end
  end

  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end


  private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:deleted,
        :username, :email, 
        :phone, :phone2,  
        :first_name, :last_name,
        :birthday, :gender,
        :highest_education, :highest_education_verified,

        :user_street_address, :user_district,
        :user_city, :user_province,
        :user_country, :user_region,

        :national_id, :drivers_license,
        :social_security, :voters_id,
        :status, :about, :avatar, :website,
        {avatars: []},
        :facebook, :linkedin, :skype,
        # :location, :location_id,
        :user_verification_type, :profile_completion, :admin,
        :founding_user, :user_score, :user_points,
        :password)
        
    end
end