# frozen_string_literal: true

class Like < ApplicationRecord
    after_create_commit :create_notification

    belongs_to :user
    belongs_to :article

    private
        def create_notification
            user = self.article.user
            user.increment!(:unread)
            Notification.create(
                content: "#{self.user.name}さんが「#{self.article.title}」をいいねしました。",
                user_id: user.id,
                article_id: self.article.id
            )
        end
end
