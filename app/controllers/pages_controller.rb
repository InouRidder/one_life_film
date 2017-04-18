class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :portfolio ]

  def home
  end

  def portfolio
    @films = Film.where(promotion: true)
  end

end
