class ItemsChannel < ApplicationCable::Channel
  def self.broadcast(item)
    broadcast.to item, item:
    ItemsController.render(partial: 'items/form', locals: {item: item})
  end
  
  def subscribed
    # stream_from "some_channel"
    stream_for Item.last
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
