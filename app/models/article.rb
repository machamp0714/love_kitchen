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
      self.pictures[0].image.to_s
    else
      'blank.jpg'
    end
  end
end
