class Request < ApplicationRecord
  has_one :booking

  scope :active, -> { where("state != 'declined' AND date_wedding >= ? ", Date.today)}
  scope :cancels, -> { where("date_wedding <  ?", Date.today).or(where(state: 'declined')) }

  scope :rt_quotations, -> {where(state: 'quotation').count}
  scope :rt_requests, -> {active.count}
  scope :rt_cancels, -> {cancels.count}


  def update_state(new_state)
    self.state = new_state
  end

  def approved?
    state == 'approved'
  end

  def cancelled?
    state == 'declined'
  end

  def decline
    self.state = 'declined'
  end


end
