# frozen_string_literal: true

class Relationship < ApplicationRecord
    after_create_commit :create_notification

    belongs_to :followed, class_name: "User"
    belongs_to :follower, class_name: "User"

    private
        def create_notification
            Notification.create(
                content: "「#{self.follower.name}」さんがあなたをフォローしました。",
                user_id: self.followed.id,
                follower_id: self.follower.id
            )
        end
end
