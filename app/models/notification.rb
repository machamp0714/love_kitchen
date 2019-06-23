class Notification < ApplicationRecord
  belongs_to :user

  def self.count_unread
    Notification.where(user_id: Current.user.id, already: false).count
  end

  def article
    Article.find_by(id: self.article_id)
  end

  def article_title
    article.title
  end

  def user_name
    User.find_by(id: self.like_user_id).name
  end
end
