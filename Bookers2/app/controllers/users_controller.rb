class UsersController < ApplicationController

before_action :authenticate_user!

  def show
  	@user = User.find(params[:id])
  	@books = @user.books
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
    if @user != current_user
       redirect_to user_path(current_user.id)
    end
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
    @user = current_user
    @users = User.all
    @book = Book.new
  end

  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end


end
