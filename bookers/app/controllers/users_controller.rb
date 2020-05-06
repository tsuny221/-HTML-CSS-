class UsersController < ApplicationController
	before_action :authenticate_user!
	before_action :ensure_correct_user, {only: [:edit,:update,:destroy]}
  def index
  	@users = User.all
  	@book = Book.new
  	@user = current_user
  end
  def show
  	@user = User.find(params[:id])
  	@book = Book.new
  	@books = @user.books.page(params[:page]).reverse_order
  end
  def edit
  	@user = User.find(params[:id])
  end
  def update
  		@user = User.find(params[:id])
  	if @user.update(user_params)
  		flash[:notice] = "You have updated book successfully."
  		redirect_to user_path(@user)
  	else
  		render :edit
  	end
  end
  private
   def ensure_correct_user
    @user = User.find(params[:id])
    if current_user != @user
    redirect_to root_path
  end
end

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
