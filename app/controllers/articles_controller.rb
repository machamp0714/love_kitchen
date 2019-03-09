class ArticlesController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
    before_action :correct_user, only: [:edit, :update, :destroy]
    before_action :set_article, only: [:show, :edit, :update, :destroy]

    def new
        @article = current_user.articles.build
        3.times { @article.pictures.build }
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
        labels = [@article.label1, @article.label2, @article.label3, @article.label4, @article.label5]
        data = [@article.data1, @article.data2, @article.data3, @article.data4, @article.data5]
        gon.labels = labels.reject { |label| label == "" }
        gon.data = data.reject { |data| data.nil? }
    end

    def edit
        
    end

    def update
        if @article.update(article_params)
            redirect_to @article, notice: 'Updated!!'
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
        params.require(:article).permit(:title,
            :content,
            :label1, :label2, :label3, :label4, :label5,
            :data1, :data2, :data3, :data4, :data5,
            pictures_attributes: [:image]
            )
    end

    def correct_user
        @article = current_user.articles.find_by(id: params[:id])
        redirect_to root_url if @article.nil?
    end

    def set_article
        @article = Article.find(params[:id])
    end

end
