class Film < ApplicationRecord
  include PgSearch
  pg_search_scope :search_by_name_and_slug, :against => [:name, :slug]

  has_many :comments, as: :commentable
  belongs_to :booking, optional: true
  before_save :set_attributes

  validates :video_url, presence: true
  validates :name, presence: true

  scope :promos, -> {where(promo: true).first(10)}

  paginates_per 10

  extend FriendlyId
  friendly_id :name, use: :slugged


  def set_attributes
    set_slug
    set_password
    set_vimeo_id
    self
  end

  def set_vimeo_id
   matched = self.video_url.match(/\d+\z/)
    if matched
      self.vimeo_id = matched
    else
      self.vimeo_id = nil
    end
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
