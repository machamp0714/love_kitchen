class ApplicationController < ActionController::Base
    private
        def own_article?
            @article = Article.find(params[:article_id])
            redirect_to @article if current_user.id == @article.user_id
        end
end
