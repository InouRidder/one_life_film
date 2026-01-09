class Request < ApplicationRecord
  has_one :booking
  has_many :comments, as: :commentable
  default_scope -> { where("state != 'approved'") }

  SPAM_PATTERNS = [
    /script\.google\.com/i,
    /bit\.ly/i,
    /tinyurl\.com/i,
    /goo\.gl/i,
    /t\.co\//i,
    /\bhttps?:\/\/[^\s]+\.(ru|cn|xyz|top|click|loan|work)\b/i,
  ].freeze

  validate :not_spam_content

  by_star_field :date_wedding

  scope :active, -> { where("state != 'declined' AND date_wedding >= ? ", Date.today)}
  scope :cancels, -> { where("date_wedding <  ?", Date.today).or(where(state: 'declined')) }
  scope :new_arrivals, -> {where("state = 'pending'")}

  # COUNTS FOR RT STATS

  scope :rt_quotations, -> {where(state: 'quotation').count}
  scope :rt_requests, -> {active.count}
  scope :rt_cancels, -> {cancels.count}
  scope :rt_new, -> {new_arrivals.count}


  def update_state(new_state)
    self.state = new_state
  end

  def transferrable_attributes
    self.attributes.except!("id", "message", "created_at", "updated_at", "state", "source_reference", "subject").merge(request_id: self.id)
  end

  def presentable_attributes
    self.attributes.except!("id")
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

  private

  def not_spam_content
    text_to_check = [message, name, subject].compact.join(' ')
    if SPAM_PATTERNS.any? { |pattern| text_to_check.match?(pattern) }
      errors.add(:base, "Your message could not be submitted")
    end
    if text_to_check.scan(/https?:\/\//).count > 2
      errors.add(:base, "Your message could not be submitted")
    end
    if message.present? && message.length > 20 && message == message.upcase
      errors.add(:base, "Your message could not be submitted")
    end
  end
end
