# frozen_string_literal: true

class Notification < ApplicationRecord
  belongs_to :user

  def self.count_unread
    Notification.where(user_id: Current.user.id, already: false).count
  end

  def article
    Article.find_by(id: self.article_id)
  end

  delegate :title, to: :article, prefix: true

  def user_name(user_id)
    User.find_by(id: user_id).name
  end
end
