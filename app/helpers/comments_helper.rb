# frozen_string_literal: true

module CommentsHelper
    def comment_author?(comment)
        !current_user.comments.find_by(id: comment.id).nil?
    end
end
