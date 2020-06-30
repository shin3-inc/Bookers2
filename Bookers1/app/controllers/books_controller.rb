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
  	  redirect_to action: :index,
  	  notice: 'error'
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
  	if book.update(book_params)
  	   flash[:notice] = "Book was successfully uploded."
  	   redirect_to book_path(book.id)
  	else
  	   redirect_to edit_book_path(book.id)
  	end
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
