class UsersEdsController < ApplicationController
    # before_action :set_users_ed, only: [:show, :edit, :update, :destroy]

    def new
        @users_ed = UsersEd.new
        @education = Education.find(params[:id])
    end

    def create
        @users_ed = UsersEd.new users_ed_param
        if @users_ed.save
            redirect_to root_path
            #education_path(@users_ed.education)
        else
            # redirect_to root_path
            raise "cannot join this education"
        end
    end

    def users_group_param
        params.require(:users_group).permit(:user_id,:group_id, :status, :position)
    end

    private
    # def set_users_ed
    #     @users_ed = UsersEd.find(params[:id])
    # end

    def users_ed_param
        params.require(:users_ed).permit(:user_id, :education_id, :course_name, :to_date, :from_date)
    end

end