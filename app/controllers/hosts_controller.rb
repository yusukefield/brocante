class HostsController < ApplicationController
  before_action :set_host
  before_action :authenticate_host!, only: [:edit, :update]
def show
     @events = Event.where(host_id: @host.id).all
  end

  def edit
  end

  def update
    if current_host == @host

     if @host.update(host_params)
        flash[:success] = 'ユーザー情報を編集しました。'
        redirect_to host_path(@host)
      else
        flash.now[:danger] = 'ユーザー情報の編集に失敗しました。'
        render :edit
     end
    end
  end

  private
  def set_host
    @host = Host.find(params[:id])
  end
  def host_params
      params.require(:host).permit(:group_name, :rep_name, :address, :phonenum, :url, :email)
  end
end
