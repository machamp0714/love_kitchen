# frozen_string_literal: true

class User < ApplicationRecord
  before_save { self.name = name.downcase }
  extend FriendlyId
  friendly_id :name, use: :slugged

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :omniauthable

  mount_uploader :avatar, AvatarUploader

  has_many :articles, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :notifications, dependent: :destroy
  has_many :active_relationships,
    class_name: "Relationship",
    foreign_key: "follower_id",
    dependent: :destroy
  has_many :passive_relationships,
    class_name: "Relationship",
    foreign_key: "followed_id",
    dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower
  has_many :rooms, dependent: :destroy
  has_many :messages, dependent: :destroy

  validates :name,
    presence: true,
    length: { in: 3..20 },
    format: { with: /\A[\w@-]*[A-Za-z][\w@-]*\z/ }, # 半角英数字のみ ただし数字のみは不可
    uniqueness: { case_sensitive: false },
    ban_reserved: true

  validates :introduce,
    length: { maximum: 200 }

  def follow(other_user)
    following << other_user
  end

  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  def following?(other_user)
    following.include?(other_user)
  end

  def feed
    following_ids = "SELECT followed_id FROM relationships WHERE follower_id = :user_id"
    Article.includes(:user).where("user_id IN (#{following_ids}) OR user_id = :user_id", user_id: id).order(created_at: :desc)
  end

  def self.find_for_oauth(auth)
    user = User.where(uid: auth.uid, provider: auth.provider).first

    unless user
      user = User.create(
        uid: auth.uid,
        provider: auth.provider,
        email: User.get_email(auth),
        password: Devise.friendly_token[0, 20],
        name: auth.info.nickname,
        remote_avatar_url: auth.info.image
      )
    end

    return user
  end

  def self.get_email(auth)
    auth.info.email || "#{auth.uid}-#{auth.provider}@example.com"
  end
end
