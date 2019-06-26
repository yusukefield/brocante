class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  before_action :authenticate_user!, only: [:edit, :update]
  def show
     @join = Join.where(user_id: @user.id).all
     @articles = Article.where(user_id: @user.id).all
     @like = Like.where(user_id: @user.id).all
  end

  def edit
  end

  def update
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
  def set_user
      @user = User.find(params[:id])
  end
  def user_params
      params.require(:user).permit(:name, :webname, :profile, :image, :email)
  end

end
