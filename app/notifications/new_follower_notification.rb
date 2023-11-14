# To deliver this notification:
#
# NewFollowerNotification.with(post: @post).deliver_later(current_user)
# NewFollowerNotification.with(post: @post).deliver(current_user)

class NewFollowerNotification < Noticed::Base
  deliver_by :database

  param :following

  def message
    "#{params[:following].follower.email} is now a follower!"
  end
end
