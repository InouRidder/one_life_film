class Film < ApplicationRecord
  paginates_per 10

  validates :name, presence: true

  extend FriendlyId
  friendly_id :name, use: :slugged

  def set_attributes
    set_slug
    set_password
    self
  end

  def set_slug
    if self.name.include?("(")
      arr = self.name.split("(")
      arr[1] = arr.last.delete(")")
      self.slug = name_to_slug(arr.first) + "-#{arr.last}"
    else
      self.slug = name_to_slug(self.name)
    end
  end

  def set_password
   self.password = nil if self.password == ""
  end

  def name_to_slug(name)
    name.strip.gsub(/\W/, "-").gsub("--", "").downcase
  end

end
