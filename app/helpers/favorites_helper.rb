module FavoritesHelper
    def favorite?(article)
        current_user.favorites.find_by(article_id: article.id)
    end
end
