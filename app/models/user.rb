class User < ApplicationRecord
  has_many :likes, dependent: :destroy
  has_many :requests, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :active_relationships, class_name: Relationship.name,
    foreign_key: :follower_id, dependent: :destroy
  has_many :passive_relationships, class_name: Relationship.name,
    foreign_key: :followed_id, dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower
  has_many :comments

  mount_uploader :avatar, PictureUploader

  enum role: [:user, :manager, :admin]

  validates :name, presence: true, length: {maximum: Settings.maximum.name}
  validates :phone, presence: true, length: {maximum: Settings.maximum.phone}

  devise :database_authenticatable, :registerable, :recoverable, :rememberable,
    :trackable, :validatable
end
