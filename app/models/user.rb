class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :recreations, dependent: :destroy
  has_many :bookmarks,   dependent: :destroy
  has_many :recreations, through: :bookmarks, source: :recreation_id

  validates :nickname, :email, presence: true
  mount_uploader :user_image, ImageUploader
end
