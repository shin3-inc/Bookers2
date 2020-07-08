class UsersController < ApplicationController

  def about
  end

  def show
  	@user = User.find(params[:id])
  	@books = @user.books
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
  if @user.save
    flash[:notice] = "Book was successfully created."
    redirect_to user_path(@user.id)
  else
    render :edit
  end
  end

  def index
    @users = User.all

  end




  private
  def user_params
    params.require(:user).permit(:username, :profile_image, :introduction)
  end

end
