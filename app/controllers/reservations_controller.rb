class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all
  end

  def new
    @room = Room.find(params[:id])
    @reservation = Reservation.new(reservation_params)
  end

  def back
    binding.pry
    @reservation = Reservation.new(reservation_params)
    render "new"
  end

  def check
    @room = Room.find(reservation_params[:room_id])
    @reservation = current_user.reservations.build(reservation_params)

    if @reservation.invalid?
      flash[:danger] = "Invalid parameters"
      render "rooms/show"
    end

    @user_id = current_user.id
    @days = (@reservation.end_date - @reservation.start_date).to_i
    @price = @days*@room.room_price*@reservation.person_num

    redirect_to reservations_confirm_path(
      start_date: @reservation.start_date,
      end_date: @reservation.end_date,
      person_num: @reservation.person_num,
      price: @price,
    )
  end

  def confirm
    @start_date = params[:start_date]
    @end_date = params[:end_date]
    @person_num = params[:person_num]
    @price = params[:price]
  end

  # def complete
  #   Reservation.create!(reservation_params)
  # end


  def create
    @reservation = current_user.reservations.build(reservation_params)
    if @reservation.save
      binding.pry
      flash[:notice] = "You made a reservation"
      redirect_to rooms_path
    else
      redirect_to rooms_path
    end
  end

  def show
    @room = Room.find(params[:room_id])
    @reservation = Reservation.find(params[:id])
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
