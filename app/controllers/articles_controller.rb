class ArticlesController < ApplicationController
    before_action :authenticate_user!
    before_action :correct_user, only: [:edit, :update, :destroy]
    before_action :set_article, only: [:show, :edit, :update, :destroy]

    def new
        @article = Article.new
    end

    def create
        @article = current_user.articles.build(article_params)
        if @article.save
            redirect_to @article, notice: 'Success!!'
        else
            render :new
        end
    end

    def show 
        
    end

    def edit
        
    end

    def update
        if @article.update(article_params)
            redirect_to current_user, notice: 'Updated!!'
        else
            render :edit
        end
    end

    def destroy
        @article.destroy
        redirect_to current_user, notice: 'Deleted!!'
    end

    private

    def article_params
        params.require(:article).permit(:title, :content, :label1, :label2, :label3, :label4, :label5, :data1, :data2, :data3, :data4, :data5)
    end

    def correct_user
        @article = current_user.articles.find_by(id: params[:id])
        redirect_to root_url if @article.nil?
    end

    def set_article
        @article = Article.find(params[:id])
    end

end
