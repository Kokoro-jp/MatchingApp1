class Room < ApplicationRecord
    has_many :reservations, dependent: :destroy
    belongs_to :user
    mount_uploader :room_img, ImageUploader

    validates :room_name, presence: true
    validates :room_introduction, presence: true
    validates :room_price, presence: true
    validates :room_address, presence: true, numericality: true
    validates :room_img, presence: true
end
