class Book < ApplicationRecord
  belongs_to :category
  belongs_to :publisher

  has_many :reviews, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :request_items, dependent: :destroy
  has_many :book_items, dependent: :destroy

  validates :title, presence: true, length: {maximum: Settings.maximum.name}
  validates :description, presence: true,
    length: {maximum: Settings.maximum.description}
  validates :category_id, presence: true
  validates :publisher_id, presence: true
end
