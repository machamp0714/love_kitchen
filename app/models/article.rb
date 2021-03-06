# frozen_string_literal: true

class Article < ApplicationRecord
  belongs_to :user

  after_destroy_commit :delete_notifications
  
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

  scope :with_user, -> { includes(:user) }

  scope :with_pictures, -> { includes(:pictures) }

  scope :order_by_created, -> { order(created_at: :desc) }

  scope :order_by_views_count, -> { order(view_count: :desc) }

  scope :order_by_likes_count, -> {
    joins(:user)
    .joins(:likes)
    .select("articles.id, articles.title, articles.created_at, articles.user_id, users.name, users.avatar, count(likes.article_id) as likes_count")
    .group("likes.article_id")
    .order("likes_count DESC")
    .order("articles.created_at DESC")
  }

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

  def set_labels
    self.attributes.map { |key, value| value if key.include?("label") }.reject { |value| value.blank? }
  end

  def set_data
    self.attributes.map { |key, value| value if key.include?("data") }.reject { |value| value.blank? }
  end

  private

    def delete_notifications
      Notification.where(article_id: self.id).destroy_all
    end
end
