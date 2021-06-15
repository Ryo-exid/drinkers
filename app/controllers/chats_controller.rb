class ChatsController < ApplicationController

  def show
    @user = User.find(params[:id])
    rooms = current_user.user_rooms.pluck(:room_id)
    user_rooms = UserRoom.find_by(user_id: @user.id, room_id: rooms)
    if user_rooms.nil?
      @room = Room.new
      @room.save
      UserRoom.create(user_id: @user.id, room_id: @room.id)
      UserRoom.create(user_id: current_user.id, room_id: @room.id)
    else
      @room = user_rooms.room
    end
    @chats = @room.chats
    @chat = Chat.new(room_id: @room.id)
    @@messenger = @user.id
  end

  def create
    @chat = current_user.chats.new(chat_params)
    @chat.save
    messenger_id = @@messenger
    user = User.find(messenger_id)
    temp = Notification.where(["visited_id = ? and visited_id = ? and action = ?", current_user.id, user.id, "chat"])
    if temp.blank?
      notification = user.passive_notifications.new(
        visiter_id: current_user.id,
        action: "chat"
      )
      notification.save
    end
  end

  private
  def chat_params
    params.require(:chat).permit(:message, :room_id)
  end
end