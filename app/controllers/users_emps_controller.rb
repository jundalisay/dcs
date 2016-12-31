class UsersEmpsController < ApplicationController
    # before_action :set_users_emp, only: [:show, :edit, :update, :destroy]

    def new
        @users_emp = UsersEmp.new
        @employment = Employment.find(params[:id])
    end

	def create
        @users_emp = UsersEmp.new users_emp_param
        if @users_emp.save
            redirect_to employment_path(@users_emp.employment)
        else
            raise "cannot join this employment"
        end
    end

    private
    def set_users_emp
        @users_emp = UsersEmp.find(params[:id])
    end

    def users_emp_param
        params.require(:users_emp).permit(:user_id, :employment_id, :from_date, :to_date, :position)
    end

end
