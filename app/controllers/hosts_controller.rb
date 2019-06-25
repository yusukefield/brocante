class HostsController < ApplicationController
def show
     @host = Host.find(params[:id])
     #@events = @host.events
     @events = Event.where(host_id: @host.id).all
  end

  def edit
     @host = Host.find(params[:id])
  end

  def update
    @host = Host.find(params[:id])
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
  def host_params
      params.require(:host).permit(:group_name, :rep_name, :address, :phonenum, :url, :email)
  end
end
