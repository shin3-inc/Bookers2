class BooksController < ApplicationController



  def new
  end

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
  	@books = Book.all
  	@book = Book.new
  end
  def show
  	@book = Book.find(params[:id])
  end



  def edit
  	@book = Book.find(params[:id])
  end

  def update
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to '/books'
  end

  private

  def book_params
  	params.require(:book).permit(:title, :body)
  end

end