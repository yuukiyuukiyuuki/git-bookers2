class BooksController < ApplicationController
  def new
    @books=Book.new
  end

  def create
    @books = Book.new(book_params)
    @books.user_id = current_user.id
    @books.save
    redirect_to books_path
  end

  def index
    @books =Book.all
  end

  def show
    @books=Book.find(params[:id])
  end

private

  def book_params
    params.require(:book).permit(:title, :body,:profile_image)
  end

end
