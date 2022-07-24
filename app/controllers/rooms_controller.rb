class RoomsController < ApplicationController
  before_action :authenticate_user!

  def index
   @rooms = Room.all
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    @user_id = current_user.id
    if @room.save
      flash[:notice]= "registrated new room"
      redirect_to @room #room予約詳細ページに飛ばす
    else
      render "new"
    end
  end

  def show
    @room = Room.find_by(id: params[:id])
  end

  # def edit
  # end

  # def update
  # end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    flash[:notice]= "deleted the room"
    redirect_to :rooms
  end
  
  def search
    binding.pry
    @search = Room.ransack(params[:q])
    @rooms = @search.result
    @numbers = @rooms.count
  end
 

  def room_params
    params.require(:room).permit(:room_name, :room_introduction, :room_price, :room_address, :room_img, :user_id)
  end
    
end
