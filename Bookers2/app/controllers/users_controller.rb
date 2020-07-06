class UsersController < ApplicationController
  def show
  	@user = User.find(params[:id]) # ここを記述
  	@books = @user.books
  end
end
