class RoomsController < ApplicationController
  before_action :set_room, only: %i[show destroy]

  def index
    @rooms = Room.all
  end

  def show
    @message = Message.new
    @messages = @room.messages
  end

  def new
    @room = Room.new
    @cities = City.all
  end

  def create
    @room = Room.new(room_params)
    @room_membership = RoomMembership.new(room_membership_params)

    if @room.save && @room_membership.save
      redirect_to @room, notice: "Room was successfully created."
    else
      @room.destroy
      flash.now[:alert] = "Something went wrong. Try again."
      render :new
    end
  end

  def follow 
    @room_membership = RoomMembership.new(room_membership_follow_params)
    redirect_to @room, notice: "You joined to the room."
  end

  def unfollow 
    RoomMembership.find_by(room_id: @room.id).destroy
  end

  def destroy
    @room.destroy
    redirect_to rooms_url, notice: "Room was successfully destroyed."
  end

  private 

  def set_room
    @room = Room.find(params[:id])
  end

  def room_params
    params.require(:room).permit(:city_id, :description, :deadline_at)
  end

  def room_membership_params
    {
      room: @room,
      user: current_user,
      role: :owner
    }
  end

  def room_membership_follow_params
    {
      room: @room,
      user: current_user,
      role: :member
    }
  end
end
