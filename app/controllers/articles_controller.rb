class ArticlesController < ApplicationController
    before_action :authenticate_user!, except: [:show]
    before_action :correct_user, only: [:title, :content, :pictures, :chart, :update, :destroy]

    def new
        @article = current_user.articles.build
        3.times { @article.pictures.build }
    end

    def create
        @article = current_user.articles.build(article_params)
        pictures = @article.pictures
        if @article.save
            redirect_to @article, notice: 'Success!!'
        else
            create_form(pictures)
            render :new
        end
    end

    def show
        @article = Article.find(params[:id])
        if user_signed_in?
            @article.update(view_count: @article.view_count + 1) if current_user.id != @article.user_id
        end
        labels = [@article.label1, @article.label2, @article.label3, @article.label4, @article.label5]
        data = [@article.data1, @article.data2, @article.data3, @article.data4, @article.data5]
        @pictures = @article.pictures.reject { |picture| picture.image.blank? }
        gon.labels = labels.reject { |label| label.blank? }
        gon.data = data.reject { |data| data.blank? }
    end

    def title
        @article = Article.find(params[:id])
    end

    def content
        @article = Article.find(params[:id])
    end

    def pictures
        @article = Article.find(params[:id])
    end

    def chart
        @article = Article.find(params[:id])
        labels = [@article.label1, @article.label2, @article.label3, @article.label4, @article.label5]
        data = [@article.data1, @article.data2, @article.data3, @article.data4, @article.data5]
        
        gon.labels = labels.reject { |label| label.blank? }
        gon.data = data.reject { |data| data.blank? }
    end

    def update
        @article = Article.find(params[:id])
        if @article.update(update_article_params)
            flash[:notice] = '更新しました。'
        else
            flash[:alert] = '入力に誤りがあります。'
        end
        redirect_back(fallback_location: request.referer)
    end

    def destroy
        @article = Article.find(params[:id])
        @article.destroy
        if notification = Notification.where(article_id: @article.id)
            notification.destroy_all
        end
        redirect_to current_user, notice: 'Deleted!!'
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
        redirect_to root_url if @article.nil?
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
