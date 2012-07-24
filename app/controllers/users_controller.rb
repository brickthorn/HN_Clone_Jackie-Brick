class UsersController < ApplicationController
  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(:name => params[:user][:name], :email => params[:user][:email], :password => params[:user][:password])
    if @user.save
      redirect_to articles_path  # need to redirect to user_session_new page
    else
      render "new"         # go back to the signup page and display errors
    end
  end

  def show
    redirect_to "/404.html"
  end
  
  def edit
  end

  def update
  end

  def destroy
  end
end
