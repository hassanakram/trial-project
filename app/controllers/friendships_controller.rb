class FriendshipsController < ApplicationController
  before_action :set_user
  before_action :set_friendship, only: [:destroy]

  def create
    @friendship = Friendship.new(friendship_params)

    if @friendship.save
      render json: @friendship, status: :created, location: @friendship
    else
      render json: @friendship.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @friendship.destroy
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_friendship
    @friendship = user.friendships(id: params[:id])
  end

  def friendship_params
    params.require(:friendship).permit(:user_id, :friend_id)
  end

end
