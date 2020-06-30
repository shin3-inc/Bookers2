class BooksController < ApplicationController

  def top

  end

  def index
  	@books = Book.all
  	@book = Book.new
  end

  def create
  	book = Book.new(book_params)
  	if book.save
  	  flash[:notice] = "Book was successfully created."
  	  redirect_to book_path(book.id)
  	else
  	  redirect_to book_path(book.id)
  	end
  end


  def show
  	@book = Book.find(params[:id])
  end

  #def new
  #end

  def edit
  	@book = Book.find(params[:id])
  end

  def update
  	book = Book.find(params[:id])
  	book.update(book_params)
  	redirect_to book_path(book.id)
  end

  def destroy
  	book = Book.find(params[:id]) #データ(レコード)を1件取得
    book.destroy #データ（レコード）を削除
    redirect_to books_path #List一覧画面へリダイレクト
  end

  private

  def book_params
  	params.require(:book).permit(:title, :body)
  end

end
