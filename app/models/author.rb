class Author < ApplicationRecord
  has_many :book_items, dependent: :destroy

  validates :name, presence: true, length: {maximum: Settings.maximum.name},
    uniqueness: true
  validates :description, presence: true,
    length: {maximum: Settings.maximum.description}
end
