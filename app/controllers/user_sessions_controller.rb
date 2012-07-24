class UserSessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_email(params[:user_sessions][:email])
    if @user && User.authenticate(params[:user_sessions][:email], params[:user_sessions][:password])
      redirect_to articles_path
    else
      flash[:alert] = "Invalid Email or Password"
      render 'new'
    end
  end

  # def destroy
  #   sign_out
  #   redirect_to root_path
  # end
  
  def show
    
  end
  
end
