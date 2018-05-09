class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_one :booking
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  private

  def self.find_or_create(email)
    if user = User.find_by_email(email)
      user
    else
      User.create(email: email, password: "123#{email}")
    end
  end

end
