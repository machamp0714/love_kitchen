class Article < ApplicationRecord
  belongs_to :user
  has_many :pictures, dependent: :destroy
  has_one :chart, dependent: :destroy

  accepts_nested_attributes_for :pictures

  validates :title, presence: true
  validates :content, presence: true
end
