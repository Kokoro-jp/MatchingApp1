class RoomsController < ApplicationController
  before_action :authenticate_user!

  def index
   @rooms = Room.all
  end

  def new
    @room = Room.new
  end

  def create
    @user_id = current_user.id
    @room = current_user.rooms.build(room_params)
    if @room.save
      flash[:notice]= "registrated new room"
      redirect_to @room #room予約詳細ページに飛ばす reservations/#{@room.id}
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

  def room_params
    params.require(:room).permit(:room_name, :room_introduction, :room_price, :room_address, :room_img)
  end
end
