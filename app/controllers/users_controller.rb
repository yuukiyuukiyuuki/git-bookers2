class UsersController < ApplicationController
  def show
    @book=Book.new
    @user=User.find(params[:id])
    @books=@user.books
    @users=current_user
  end

  def edit
    @user=User.find(params[:id])

  end

  def update
    @user=User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  def index
    @users=User.all
    @user=current_user
  end

  def create
    @user=User.new(user_params)
   if @user.save
    flash[:notice] ="Signed in successfully."
    redirect_to user_path(user.id)
   end
  end

  def get_profile_image
    if image.attached?
      image
    else
      'no_image.jpg'
    end
  end

private

  def user_params
    params.require(:user).permit(:name, :profile_image,:introduction)
  end
end