class FollowersController < ApplicationController

  def index
    user_id = current_user[:id]
    Follower.save_to_database(followers_hash, user_id)
    @display_followers = Follower.where(:user_id => user_id)
  end

  private

  def followers_hash
    @followers = client.followers
  end
end
