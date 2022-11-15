class FriendRequestsController < ApplicationController
    #before_action :set_friend_request, except: [:index, :create]

    def index
        @incoming = FriendRequest.where(friend: current_user)
        @outgoing = current_user.friend_requests
      end

    def create
      friend = User.find(params[:friend_id])
      @friend_request = current_user.friend_requests.new(friend: friend)

      if @friend_request.save
        flash[:notice] = "Friend request sent"
      else
        render json: @friend_request.errors, status: :unprocessable_entity
      end
    end

    def accept
      friend = User.find(params[:id])
      current_user.friends << friend
      flash[:notice] = "Friend request accepted"
      redirct_to friend_requests_path
      destroy
    end

    def reject
        flash[:notice] = "Friend request rejected"
        redirct_to friend_requests_path
        destroy
    end

    def destroy
      @friend_request = FriendRequest.where(user: params[:id], friend: current_user).first
      if @friend_request.present?
        @friend_request.destroy
      end
    end


    private
    def friend_request_params
        params.require(:friend_request).permit(:friend_id, :user_id)
      end
end
