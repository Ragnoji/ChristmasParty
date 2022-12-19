class MessagesController < ApplicationController
    skip_before_action :verify_authenticity_token
    before_action :set_room, only: %i[create] 

    def create
        @message = Message.new(message_params.merge({room: @room, user: current_user}))
        if @message.save
            flash[:notice] = "Message created"
            #broadcast_message_create
            redirect_to room_path(@room)
        else
            flash.now[:notice] = "Something went wrong"
            render "rooms/show"
        end
    end

    def edit
    end

    def update
    end

    private

    def message_params
        params.require(:message).permit(:content)
    end

    def set_room
        @room = Room.find(params[:room_id])
    end
end