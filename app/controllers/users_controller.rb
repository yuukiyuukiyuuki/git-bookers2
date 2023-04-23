class UsersController < ApplicationController
  def show
    @book=Book.new
    @user=User.find(params[:id])
    @books=@user.books
    @users=current_user
  end

  def edit
    @user=User.find(params[:id])
   unless
     @user.id == current_user.id
    redirect_to book_path
   end
  end

  def update
    @user=User.find(params[:id])
    @user.update(user_params)
    if@user.save
    flash[:notice] = "You have updated user successfully."
    redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def index
    @users=User.all
    @user=current_user
  end

  def create
    @user=User.new(user_params)
   if @user_log_in.save
    flash[:notice] ="Signed in successfully."
    redirect_to user_path(user.id)
   end
   if @user_sign_in.save
    flash[:notice] ="Welcome! You have signed up successfully."
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