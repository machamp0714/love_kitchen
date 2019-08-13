class ApplicationController < ActionController::Base
    before_action :set_search
    around_action :set_current_user

    private
        def own_article?
            @article = Article.find(params[:article_id])
            redirect_to @article if current_user.id == @article.user_id
        end

        def correct_user
            @article = current_user.articles.find_by(id: params[:id])
            redirect_to root_url if @article.nil?
        end

        def set_search
            @q = Article.ransack(params[:q])
            @search_articles = @q.result.includes(:user)
        end

        def set_current_user
            Current.user = current_user
            yield
        ensure
            Current.user = nil
        end
end
