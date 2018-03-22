class RequestDecorator < ApplicationDecorator
  delegate_all

  def btn_state(btn)
    if btn == self.state
      "active-#{btn}"
    end
  end

  def pretty_state
    case self.state
    when "quotation" then "offerte"
    when "first_contact" then "Eerste Contact"
    when "feedback" then "Terugkoppeling"
    when "approved" then "Definitief"
    when "declined" then "Cancel"
    else
      "pending"
    end
  end

end
