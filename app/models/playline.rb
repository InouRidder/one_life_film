class Playline < ApplicationRecord

  belongs_to :playbook
  validates :content, length: { minimum: 2 }

  def set_order
    self.order_number = self.playbook.playlines.length + 1
  end

  def numeric_time
    if begin_time
      if begin_time.include?("3")
        time_array = begin_time.split(":")
        time_array.first.to_i + 0.5
      else
        begin_time.to_i
      end
    end
  end

  # CONSTANTS

  TIMES = ["5", "5:30", "6","6:30","7","7:30","8","6:30","9","9:30","10","10:30","11","11:30","12","12:30","13","13:30","14","14:30","15","15:30","16","16:30","17","17:30", "18","18:30","19","19:30","20","20:30","21","21:30","22","22:30","23","23:30","00"]

  SUGGESTED_LINES = [{content: "start time groom", city: "Amsterdam", address: "Keizersgracht 422-2", begin_time: "6:30", phone_number: "06XXXXXXXX", contact: "Mr X", order_number: 1},{content: "start time bride", city: "Amsterdam", address: "Keizersgracht 422-2", begin_time: "6:30", phone_number: "06XXXXXXXX", contact: "Mr X", order_number: 2}, {content: "Putting on wedding dress", city: "Amsterdam", address: "Keizersgracht 422-2", begin_time: "7:30", phone_number: "06XXXXXXXX", contact: "Mr X", order_number: 3}, {content: "Meeting moment bride and groom", city: "Amsterdam", address: "Keizersgracht 422-2", begin_time: "9:00", phone_number: "06XXXXXXXX", contact: "Mr X", order_number: 4}, {content: "Photoshoot", city: "Amsterdam", address: "Keizersgracht 422-2", begin_time: "9:30", phone_number: "06XXXXXXXX", contact: "Mr X", order_number: 5}, {content: "Ceremony", city: "Amsterdam", address: "Keizersgracht 422-2", begin_time: "10:30", phone_number: "06XXXXXXXX", contact: "Mr X", order_number: 6}, {content: "Reception", city: "Amsterdam", address: "Keizersgracht 422-2", begin_time: "14:30", phone_number: "06XXXXXXXX", contact: "Mr X", order_number: 7},{content: "Diner", city: "Amsterdam", address: "Keizersgracht 422-2", begin_time: "17:30", phone_number: "06XXXXXXXX", contact: "Mr X", order_number: 8},{content: "Party", city: "Amsterdam", address: "Keizersgracht 422-2", begin_time: "20:30", phone_number: "06XXXXXXXX", contact: "Mr X", order_number: 9},{content: "Start of film", begin_time: "22:00", order_number: 10}]
end
