class BooksController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user,{only: [:edit,:update,:destroy]}
   def index
  	@books = Book.all
  	@book = Book.new
  end
  def show
    @books = Book.find(params[:id])
    @book = Book.new
    @user = User.find_by(@book.user_id)
  end
  def create
  	@book = Book.new(book_params)
    @book.user_id = current_user.id
  	if @book.save
  		flash[:notice] = "You have creatad book successfully."
  		redirect_to book_path(@book)
  	else
      @books = Book.all
  		render :index
  	end
  end
  def edit
  	@book = Book.find(params[:id])
  end
  def update
  	@book = Book.find(params[:id])
  	if @book.update(book_params)
  		flash[:notice] = "You have updated book successfully."
  		redirect_to book_path(@book)
  	else
  		render :edit
  	end
  end
  def destroy
  	book = Book.find(params[:id])
  	book.destroy
  	redirect_to books_path
  end
  private
  def ensure_correct_user
    @book = Book.find(params[:id])
    if @book.user_id != current_user.id
    redirect_to books_path
    end
  end
  def book_params
  	params.require(:book).permit(:title, :body, :user_id)
  end
end
