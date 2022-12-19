module Rooms
  class FollowsController < ApplicationController
    before_action :set_room

    def create
      @room_membership = RoomMembership.new(room_membership_follow_params)
      @room_membership.save
      redirect_to @room, notice: "You joined to the room."
    end
  
    def destroy
      RoomMembership.find_by(room: @room, user: current_user).destroy
      redirect_to @room, notice: "You unfollowed the room."
    end

    private

    def room_membership_follow_params
      {
        room: @room,
        user: current_user,
        role: :member
      }
    end

    def set_room
      @room = Room.find(params[:room_id])
    end
  end
end
