class Booking < ApplicationRecord
  belongs_to :request, optional: true
  has_one :form
end
