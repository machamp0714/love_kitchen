class ArticlesController < ApplicationController
    before_action :authenticate_user!
    before_action :correct_user, only: [:edit, :update, :destroy]
    before_action :set_article, only: [:show, :edit, :update, :destroy]

    def new
        @article = current_user.articles.build
        @article.build_chart
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
        if @article.chart.nil?
            @article
        else
            numbers = [0, 1, 2, 3, 4]
            labels = [@article.chart.label1, @article.chart.label2, @article.chart.label3, @article.chart.label4, @article.chart.label5]
            data = [@article.chart.data1, @article.chart.data2, @article.chart.data3, @article.chart.data4, @article.chart.data5]
            gon.labels = []
            gon.data = []
            numbers.each do |n| 
                gon.labels << labels[n]
                gon.data << data[n]
            end
        end
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
        params.require(:article).permit(:title,
            :content,
            chart_attributes: [:label1, :label2, :label3, :label4, :label5, :data1, :data2, :data3, :data4, :data5, :article_id],
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
