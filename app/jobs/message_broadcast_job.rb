class MessageBroadcastJob < ApplicationJob
 

  def perform(message)
    ActionCable.server.broadcast 'room_channel', message: render_message(message)
    # Do something later
  end

  private

    def render_message(message)
      ApplicationController.renderer.render partial: 'messages/message', locals: { message: message }
      
    end
end
