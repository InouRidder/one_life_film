class Playline < ApplicationRecord
  TIMES = ["5", "5:30", "6","6:30","7","7:30","8","6:30","9","9:30","10","10:30","11","11:30","12","12:30","13","13:30","14","14:30","15","15:30","16","16:30","17","17:30", "18","18:30","19","19:30","20","20:30","21","21:30","22","22:30","23","23:30","00"]

  belongs_to :playbook
  validates :location, :content, presence: true
  validates :content, length: { minimum: 10 }

  def set_order
    self.order_number = self.playbook.playlines.length + 1
  end

  def numeric_time
    if begin_time.length > 1
      time_array = begin_time.split(":")
      time_array.first.to_i + 0.5
    else
      begin_time.to_i
    end
  end
end
