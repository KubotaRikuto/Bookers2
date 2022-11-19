class BooksController < ApplicationController
  # userのshowと一緒の画面で表示
  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id

    if @book.save
        # books/showにリダイレクト
    else
        # books/indexにリダイレクト
        render :index
    end
  end
  
  def index
      @book = Book.all
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
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
