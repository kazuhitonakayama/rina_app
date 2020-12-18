class Like < ApplicationRecord
  belongs_to :place
  belongs_to :user

  validates_uniqueness_of :place_id, scope: :user_id

end
