# frozen_string_literal: true

class ArticlesController < ApplicationController
    before_action :authenticate_user!, except: [:show]
    before_action :correct_user, only: [:title, :content, :pictures, :chart, :update, :destroy]

    def new
        @article = current_user.articles.build
        3.times { @article.pictures.build }
    end

    def create
        @article = current_user.articles.build(article_params)
        if @article.save
            redirect_to @article, notice: "Success!!"
        else
            create_form(@article.pictures)
            render "new"
        end
    end

    def show
        @article = Article.find(params[:id])
        @article.increment(:view_count, 1) if user_signed_in? && current_user.id != @article.user_id
        @pictures = @article.pictures.reject { |picture| picture.image.blank? }
        gon.labels = @article.set_labels
        gon.data = @article.set_data
    end

    def title
        @article = Article.find(params[:id])
    end

    def content
        @article = Article.find(params[:id])
    end

    def pictures
        @article = Article.find(params[:id])
        @picture = @article.pictures.build
        @pictures = @article.pictures.reject { |picture| picture.image.blank? }
    end

    def chart
        @article = Article.find(params[:id])
        gon.labels = @article.set_labels
        gon.data = @article.set_data
    end

    def update
        @article = Article.find(params[:id])
        if @article.update(update_article_params)
            flash[:notice] = "更新しました。"
        else
            flash[:alert] = "入力に誤りがあります。"
        end
        redirect_back(fallback_location: request.referrer)
    end

    def destroy
        Article.find(params[:id]).destroy
        redirect_to current_user, notice: "Deleted!!"
    end

    private

    def article_params
        params.require(:article).permit(
            :title,
            :content,
            :label1, :label2, :label3, :label4, :label5,
            :data1, :data2, :data3, :data4, :data5,
            pictures_attributes: [:image]
        )
    end

    def update_article_params
        params.require(:article).permit(:title,
            :content,
            :label1, :label2, :label3, :label4, :label5,
            :data1, :data2, :data3, :data4, :data5,
            pictures_attributes: [:image, :_destory, :id])
    end

    def correct_user
        @article = current_user.articles.find_by(id: params[:id])
        redirect_to root_url if @article.blank?
    end

    def create_form(pictures)
        case pictures.size
        when 0
            3.times { pictures.build }
        when 1
            2.times { pictures.build }
        when 2
            pictures.build
        end
    end
end
