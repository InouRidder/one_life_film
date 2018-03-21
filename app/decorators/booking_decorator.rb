class BookingDecorator < ApplicationDecorator
  delegate_all

  def btn_state(btn)
    if btn == self.state
      "active-#{btn}"
    end
  end

end
