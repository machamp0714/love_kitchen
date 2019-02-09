class ArticlesController < ApplicationController
    before_action :authenticate_user!

    def new
        @article = Article.new
    end

    def create
        @article = current_user.articles.build(article_params)
        if @article.save
            redirect_to current_user, notice: 'Success!!'
        else
            render :new
        end
    end

    private

    def article_params
        params.require(:article).permit(:title, :content)
    end

end
