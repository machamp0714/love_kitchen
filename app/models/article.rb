# frozen_string_literal: true

class Article < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :pictures, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :favorites, dependent: :destroy

  accepts_nested_attributes_for :pictures

  validates :title, presence: true
  validates :content, presence: true
  validates :label1, presence: true, length: { maximum: 10 }
  validates :label2, presence: true, length: { maximum: 10 }
  validates :label3, presence: true, length: { maximum: 10 }
  validates :label4, length: { maximum: 10 }
  validates :label5, length: { maximum: 10 }
  validates :data1, presence: true
  validates :data2, presence: true
  validates :data3, presence: true

  def cover_picture
    if self.pictures.size > 0
      if self.pictures[0].image.present?
        self.pictures[0].image.to_s
      else
        "blank.jpg"
      end
    else
      "blank.jpg"
    end
  end

  scope :with_user, -> { includes(:user) }

  scope :with_pictures, -> { includes(:pictures) }

  scope :order_by_created, -> { order(created_at: :desc) }

  scope :order_by_likes_count, -> {
    find_by_sql(<<-SQL)
      SELECT A.id, A.title, A.created_at, A.user_id, U.name, U.avatar, COUNT(L.article_id) AS 'likes'
      FROM articles AS A
      INNER JOIN users AS U ON A.user_id = U.id
      INNER JOIN likes AS L ON A.id = L.article_id
      GROUP BY L.article_id
      ORDER BY likes DESC, created_at DESC
    SQL
  }
end
