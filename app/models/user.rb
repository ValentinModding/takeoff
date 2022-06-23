class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  has_many :contacts, dependent: :destroy
  has_many :participations, dependent: :destroy
  has_one_attached :photo
  has_many :favorites
  has_many :activities, through: :favorites

  def favorite_for(activity)
    Favorite.find_by(user: self, activity: activity)
  end
end
