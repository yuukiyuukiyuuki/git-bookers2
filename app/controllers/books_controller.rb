class BooksController < ApplicationController
  def new
    @books=Book.new
  end

  def create
    @books = Book.new(book_params)
    @books.user_id = current_user.id
    @books.save
    flash[:notice] = "投稿が成功しました"
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
    @book=@user.books
    @user=current_user
  end

  def update
   @book=Book.find(params[:id])
   @book.update(book_params)
   redirect_to book_path(@book)
  end

  def destroy
    @book=Book.find(params[:id])
    @book.destroy
    redirect_to '/books'
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
