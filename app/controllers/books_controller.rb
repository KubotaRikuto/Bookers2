class BooksController < ApplicationController

  # before_action :user_info_new_book, only: [:index]

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      # books/showにリダイレクト
      redirect_to book_path(@book.id)
    else
      # books/indexにリダイレクト
      render :index
    end
  end

  def index
    # user_info_new_book
    @user = current_user
    @new_book = Book.new
    @books = Book.all
  end

  def show
    @user = current_user
    @new_book = Book.new
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @user = User.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book.id)
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

  def book_params
    params.require(:book).permit(:title, :body)
  end


end
