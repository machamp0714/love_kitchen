class Article < ApplicationRecord
  belongs_to :user
  has_many :pictures, dependent: :destroy

  validates :title, presence: true
  validates :content, presence: true
end
