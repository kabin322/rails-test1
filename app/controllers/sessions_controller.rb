class SessionsController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    email = user_parasm[:email]
    password = user_params[:password]
    
    if login(email, password)
      redirect_to root_url, notice: "Successfully logged in."
    else
      @user = User.new(email: email)
      render :new
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:email, :password)
  end
end
