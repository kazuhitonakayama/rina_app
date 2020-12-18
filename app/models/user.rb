class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :places,dependent: :destroy
  has_many :genres,dependent: :destroy

  has_many :likes, dependent: :destroy
  has_many :liked_places, through: :likes, source: :place


  def already_liked?(place)
    self.likes.exists?(place_id: place.id)
  end
  
  has_many :bookmarks, dependent: :destroy
  has_many :bookmarked_places, through: :bookmarks, source: :place

  def already_bookmarked?(place)
    self.bookmarks.exists?(place_id: place.id)
  end

  mount_uploader :image, ImageUploader

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
