class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all
  end

  def new
    @room = Room.find(params[:id])
    @reservation = Reservation.new(reservation_params)
  end

  def confirm
    @room = Room.find(params[:room_id])
    @reservation = Reservation.new(params.permit(:start_date, :end_date, :person_num, :room_id, :user_id))
    render 'rooms/show' if @reservation.invalid?
    @user_id = current_user.id
    @days = (@reservation.end_date - @reservation.start_date).to_i
    @price = @days*@room.room_price*@reservation.person_num
  end

  # def complete
  #   Reservation.create!(reservation_params)
  # end

  def create
    @reservation = Reservation.new(reservation_params)
    @room = @reservation.room
    if @reservation.save
      flash[:notice] = "You made a reservation"
      redirect_to @reservation
    else
      render "confirm"
    end
  end

  def show
    @reservation = Reservation.find_by(id: params[:id])
    @room = @reservation.room
    @days = (@reservation.end_date - @reservation.start_date).to_i
    @price = @days*@room.room_price*@reservation.person_num
  end

  # def edit
  # end

  # def update
  # end

  # def destroy
  # end

  private

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date, :person_num, :user_id, :room_id)
  end
end
