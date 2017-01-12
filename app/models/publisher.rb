class Publisher < ApplicationRecord
  has_many :book, dependent: :destroy

  validates :name, presence: true, length: {maximum: Settings.maximum.name}
  validates :address, presence: true, length: {maximum: Settings.maximum.address}
  validates :email, presence: true, length: {maximum: Settings.maximum.email}
  validates :phone, presence: true, length: {maximum: Settings.maximum.phone}
  validates :description, presence: true, length: {maximum:
    Settings.maximum.description}
end
