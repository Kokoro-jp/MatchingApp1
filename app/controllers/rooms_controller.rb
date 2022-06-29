class RoomsController < ApplicationController

  def index
   @rooms = Room.all
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      flash[:notice]= "registrated new room"
      redirect_to @room  #room詳細ページに飛ばす
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
