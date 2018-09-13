class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :gallery, :about, :contact ]

  def home
  end

  def gallery
    @films = Film.promos
    @first_film = Film.find(217)
    @films.insert(0, @first_film)
  end

  def about
  end

end
