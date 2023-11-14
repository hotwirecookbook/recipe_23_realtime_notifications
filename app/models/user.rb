class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :followees, foreign_key: :follower_id, class_name: "Following", dependent: :destroy
  has_many :followed_users, through: :followees

  has_many :following_users, foreign_key: :followed_user_id, class_name: "Following", dependent: :destroy
  has_many :followers, through: :following_users

  has_many :notifications, as: :recipient, dependent: :destroy

  def follows?(user)
    followed_users.include?(user)
  end
end
