class MypageController < ApplicationController
  def show
    # @articles = current_user.articles.page params[:page]
    articles = current_user.articles
    articles = acurrent_user.articles.where("title LIKE ?", "%#{params[:title]}%") if params[:title].present?

    @articles = current_user.articles.page params[:page]
  end
end
