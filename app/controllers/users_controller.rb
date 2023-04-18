class UsersController < ApplicationController
  def show
    @book=Book.new
    @user=User.find(params[:id])
    @books=@user.books
  end

  def edit
    @user=User.find(params[:id])
  end

  def update
  end

  def book_params
    params.require(:book).permit(:image)
  end

end
