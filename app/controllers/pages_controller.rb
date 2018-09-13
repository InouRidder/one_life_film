class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :gallery, :about, :contact ]

  def home
  end

  def gallery
    @first_film = Film.find(217)
    @films = Film.where(promo: true).first(10) - [@first_film]
  end

  def about
  end

end
