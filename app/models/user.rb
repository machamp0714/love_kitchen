class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  mount_uploader :avatar, AvatarUploader

  validates :name,
    presence: true,
    length: { maximum: 12 }
  validates :introduce,
    length: { maximum: 200 }
end
