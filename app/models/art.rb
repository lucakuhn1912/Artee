class Art < ApplicationRecord
  belongs_to :owner, class_name: "User"
  has_many :leases
  has_many :reviews, dependent: :destroy
  validates :name, presence: true
  validates :description, presence: true, length: { minimum: 20 }
  validates :price, numericality: true
  geocoded_by :location
  mount_uploader :picture, PhotoUploader
  after_validation :geocode, if: :will_save_change_to_location?
end
