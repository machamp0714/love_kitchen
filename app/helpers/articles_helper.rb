module ArticlesHelper
    def correct_user?
        current_user.articles.find_by(id: params[:id])
    end
end
