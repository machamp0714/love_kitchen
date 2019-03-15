class PagesController < ApplicationController
  def home
    if user_signed_in?
      articles = []
      User.joins(:articles).includes(:articles).order("articles.created_at DESC").each do |user|
        user.articles.each do |article|
          articles << article
        end
      end
      @articles = Kaminari.paginate_array(articles).page(params[:page]).per(10)
    end
  end
end
