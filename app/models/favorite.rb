# frozen_string_literal: true

class Favorite < ApplicationRecord
  after_create_commit :create_notification

  belongs_to :user
  belongs_to :article

  private
    def create_notification
      user = self.article.user
      user.increment!(:unread)
      Notification.create(content: "#{self.user.name}さんが#{self.article.title}をお気に入りに追加しました。", user_id: user.id)
    end
end
