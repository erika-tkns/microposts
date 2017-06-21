class FavoritesController < ApplicationController
  before_action :require_user_logged_in, :set_micropost
  
  def create
    current_user.good(@other_micropost)
    flash[:success] = '投稿をお気に入りしました。'
    redirect_back(fallback_location: root_url)
  end

  def destroy
    current_user.notgood(@other_micropost)
    flash[:success] = '投稿のお気に入りを解除しました。'
    redirect_back(fallback_location: root_url)
  end
  
  def set_micropost
    @other_micropost = Micropost.find(params[:micropost_id])
  end
end
