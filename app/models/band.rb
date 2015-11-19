class Band < ActiveRecord::Base
  validates :name, presence: true

  has_many :albums
  has_many(
    :tracks,
    dependent: :destroy,
    through: :albums,
    source: :tracks
  )
end
