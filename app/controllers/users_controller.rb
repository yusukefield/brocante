class UsersController < ApplicationController
  def show
     @user = User.find(params[:id])
  end

  def edit
     @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if current_user == @user
 
     if @user.update(user_params)
        flash[:success] = 'ユーザー情報を編集しました。'
        redirect_to user_path(@user)
      else
        flash.now[:danger] = 'ユーザー情報の編集に失敗しました。'
        render :edit
     end
    end
  end

  private
  def user_params
      params.require(:user).permit(:name, :webname, :profile, :image, :email)
  end
end
