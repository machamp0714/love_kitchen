class User < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  mount_uploader :avatar, AvatarUploader

  has_many :articles, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :active_relationships, 
    class_name: 'Relationship',
    foreign_key: 'follower_id',
    dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  validates :name,
    presence: true,
    length: { in: 3..20 },
    format: { with: /\A(?!\d*\z)[a-z0-9]+\z/i } # 半角英数字のみ ただし数字のみは不可

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
end
