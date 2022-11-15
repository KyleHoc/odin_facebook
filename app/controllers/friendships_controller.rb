class FriendshipsController < ApplicationController
  before_action :set_friend, only: :destroy
  def index
    @friends = current_user.friends
  end

  def create
    @friend = current_user.friends.build(params[:friend_id])
    if @friend.save
      flash[:notice] = "Friend was successfully added."
      redirect_to friend_requests_path
    else
      flash[:error] = "Unable to add friend."
      render :json => @friend.errors, :status => :unprocessable_entity
    end
  end

  def destroy
    @friend = Friendship.find_by(user: current_user.id, friend: params[:friend]) || Friendship.find_by(user: params[:friend], friend: current_user.id)
    if @friend.destroy
      flash[:notice] = "Friend was successfully removed."
      redirect_to friend_requests_path
    else
      flash[:error] = "Unable to remove friend."
      render :json => @friend.errors, :status => :unprocessable_entity
    end
  end

  private

  def set_friend
    @friend = current_user.friends.find(params[:id])
  end

  def friend_params
    params.require(:friend).permit(:friend_id)
  end
end
