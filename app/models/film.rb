class Film < ApplicationRecord
  validates :name, presence: true
  validates :video_url, presence: true
end
