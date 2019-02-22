class PagesController < ApplicationController
  def home
    if user_signed_in?
      @articles = []
      users = User.all
      users.each do |user| 
        @user_articles = user.articles_find
      end
      @user_articles.each do |article|
        @articles << article
      end
    end
  end
end
