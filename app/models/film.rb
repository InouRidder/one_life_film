class Film < ApplicationRecord

  validates :name, presence: true

  extend FriendlyId
  friendly_id :name, use: :slugged

  def set_attributes
    set_slug
    set_password
  end

  def set_slug
    self.slug = self.name.strip.gsub(" ", "-").downcase
  end

  def set_password
   self.password = nil if self.password == ""
  end
end
