# frozen_string_literal: true

module LikesHelper
    def likes?(article_id)
        current_user.likes.find_by(article_id: article_id)
    end
end
