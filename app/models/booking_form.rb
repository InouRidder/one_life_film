class BookingForm < ApplicationRecord
  belongs_to :booking
  has_many :form_lines
end
