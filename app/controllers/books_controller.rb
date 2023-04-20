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
    @user=current_user
  end

  def show
    @book=Book.new
    @user=User.find(params[:id])
    @books=@user.books
  end
  
  def edit
    @user=current_user
  end

  def get_profile_image
    if image.attached?
      image
    else
      'no_image.jpg'
    end
  end

private

  def book_params
    params.require(:book).permit(:title, :body,:profile_image)
  end

end
