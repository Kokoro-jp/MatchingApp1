class Room < ApplicationRecord
    has_many :reservations, dependent: :destroy
    belongs_to :user

    mount_uploader :room_img, ImageUploader
end
