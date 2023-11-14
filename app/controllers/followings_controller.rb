class FollowingsController < ApplicationController
  def create
    @following = Following.create(follower_id: current_user.id, followed_user_id: params[:followed_user_id])
    NewFollowerNotification.with(following: @following).deliver_later(@following.followed_user)

    redirect_to @following.followed_user, notice: "You followed #{@following.followed_user.email}"
  end
end
