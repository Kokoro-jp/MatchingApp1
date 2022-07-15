class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all
  end

  def new
    @room = Room.find(params[:id])
    binding.pry
    @reservation = Reservation.new(reservation_params)
  end

  def back
    binding.pry
    @reservation = Reservation.new(reservation_params)
    render "new"
  end

  # private

  def confirm
    binding.pry
    @room = Room.find(params[:room_id])
    binding.pry
    @reservation = Reservation.new(params.permit(:start_date, :end_date, :person_num, :room_id, :user_id))
    render 'rooms/show' if @reservation.invalid?
    @user_id = current_user.id
    binding.pry
    @days = (@reservation.end_date - @reservation.start_date).to_i
    binding.pry
    @price = @days*@room.room_price*@reservation.person_num
    binding.pry
  end

  def complete
    Reservation.create!(reservation_params)
  end


  def create
    binding.pry
    @reservation = Reservation.new(reservation_params)
    binding.pry
    @room = Room.find(params[:room_id])
    binding.pry
    if @reservation.save
      binding.pry
      flash[:notice] = "You made a reservation"
      redirect_to @reservation
    else
      binding.pry
      render "confirm"
    end
  end

  def show
    binding.pry
    @room = Room.find(params[:id])
    @reservation = Reservation.find(params[:id])
    binding.pry
  end

  # def edit
  # end

  # def update
  # end

  # def destroy
  # end

  private

  def reservation_params
    binding.pry
    params.require(:reservation).permit(:start_date, :end_date, :person_num, :user_id, :room_id)
  end
end
