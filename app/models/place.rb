class Place < ApplicationRecord
    belongs_to :user
    belongs_to :genre

    has_many :likes, dependent: :destroy
    has_many :liked_users, through: :likes, source: :user

    has_many :bookmarks, dependent: :destroy
    has_many :bookmarked_users, through: :bookmarks, source: :user

    mount_uploader :image, ImageUploader
end
