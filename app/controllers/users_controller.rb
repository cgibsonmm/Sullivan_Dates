class UsersController < ApplicationController
  def index
    @user = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
      if @user.save
        UserMailer.welcome_email(@user).deliver_now
        UserMailer.signup_notify(@user).deliver_now
        redirect_to root_path
        flash[:success] = "Thank you for registering for updates"
      else
        render 'new'
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :zip_code)
    end

end
