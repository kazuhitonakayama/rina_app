class LikesController < ApplicationController
    def create
        @like = current_user.likes.create(place_id: params[:place_id])
        redirect_back(fallback_location: root_path)
    end

    def destroy
        @like = Like.find_by(place_id: params[:place_id], user_id: current_user.id)
        @like.destroy
        redirect_back(fallback_location: root_path)
      end
end
