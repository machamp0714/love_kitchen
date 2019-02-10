class ArticlesController < ApplicationController
    before_action :authenticate_user!
    before_action :correct_user, only: [:edit, :update, :destroy]

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

    def show 
        @article = Article.find(params[:id])
    end

    def edit
        
    end

    private

    def article_params
        params.require(:article).permit(:title, :content)
    end

    def correct_user
        @article = current_user.articles.find(params[:id])
        redirect_to root_url if @article.nil?
    end

end
