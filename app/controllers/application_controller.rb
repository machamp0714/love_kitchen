# frozen_string_literal: true

class ApplicationController < ActionController::Base
    before_action :set_search
    around_action :set_current_user

    private
        def own_article?
            @article = Article.find(params[:article_id])
            redirect_to @article if current_user.id == @article.user_id
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
