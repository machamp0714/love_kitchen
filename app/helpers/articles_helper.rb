module ArticlesHelper
    def correct_user?
        @article = current_user.articles.find_by(id: params[:id])
        !@article.nil?
    end
end
