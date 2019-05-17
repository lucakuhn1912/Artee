class Art < ApplicationRecord
  belongs_to :owner, class_name: "User"
  has_many :leases
  validates :name, presence: true
  validates :description, presence: true, length: { minimum: 20 }
  validates :price, numericality: { only_integer: true }
  mount_uploader :picture, PhotoUploader
end
