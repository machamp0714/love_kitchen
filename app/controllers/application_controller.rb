class ApplicationController < ActionController::Base
    before_action :set_search

    private
        def own_article?
            @article = Article.find(params[:article_id])
            redirect_to @article if current_user.id == @article.user_id
        end

        def set_search
            @q = Article.ransack(params[:q])
            @search_articles = @q.result.includes(:user)
        end
end
