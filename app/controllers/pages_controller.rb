class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :portfolio ]

  def home
  end

  def gallery
    @films = Film.where(promo: true)
  end

  def about
  end

  def contact
  end

end
