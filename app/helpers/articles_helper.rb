module ArticlesHelper
    def correct_user?
        @article = current_user.articles.find(params[:id])
        !@article.nil?
    end
end
