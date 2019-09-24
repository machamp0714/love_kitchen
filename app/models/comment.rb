# frozen_string_literal: true

class Comment < ApplicationRecord
  after_create_commit :create_notification

  belongs_to :article
  belongs_to :user

  validates :content, presence: true

  private
    def create_notification
      user = self.article.user
      user.increment!(:unread)
      Notification.create(
        content: "#{self.user.name}さんが「#{self.article.title}」にコメントしました。",
        user_id: user.id,
        article_id: self.article.id
      )
    end
end
