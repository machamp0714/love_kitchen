module LikesHelper
    def likes?(article_id)
        current_user.likes.include?(article_id)
    end
end
