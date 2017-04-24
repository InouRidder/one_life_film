class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :gallery, :about, :contact ]

  def test
    @film = Film.all.first
  end

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
