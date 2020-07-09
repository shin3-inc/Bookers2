class BooksController < ApplicationController


  def create
    # １. データを新規登録するためのインスタンス作成
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    # ２. データをデータベースに保存するためのsaveメソッド実行
    if @book.save
      flash[:notice] = "Book was successfully created."
      # ３. トップ画面へリダイレクト
      redirect_to book_path(@book.id)

    else
      flash[:notice] = "error."
      @books = Book.all
      render :index
    end
  end

  def index
    @user = current_user
  	@books = Book.all
  	@form = Book.new

  end

  def show
    @form = Book.new
  	@book = Book.find(params[:id])
    @user = @book.user
  end

  def edit
    @book = Book.new
    @book = Book.find(params[:id])
    @user = @book.user
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
       flash[:notice] = "Book was successfully created."
       redirect_to book_path(@book.id)
    else
       render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    flash[:notice] = "Book was successfully destroyed."
    redirect_to '/books'
  end

  private
  def book_params
  	params.require(:book).permit(:title, :body)
  end

end