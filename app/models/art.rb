class Art < ApplicationRecord
  include PgSearch

  belongs_to :owner, class_name: "User"
  has_many :leases
  has_many :reviews, dependent: :destroy
  validates :name, presence: true
  validates :description, presence: true, length: { minimum: 20 }
  validates :price, numericality: true
  geocoded_by :location
  mount_uploader :picture, PhotoUploader
  after_validation :geocode, if: :will_save_change_to_location?
  pg_search_scope :search_by_name,
    against: [:name],
    using: {
      tsearch: { prefix: true }
    }
end
