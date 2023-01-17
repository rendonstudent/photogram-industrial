class Like < ApplicationRecord
  belongs_to :fan, class_name: "User"
  belongs_to :photo

  validates :fan_id, uniqueness: { scope: :photo_id, message: "You have already liked this photo" }

end
