class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :gallery, :about, :contact ]

  def home
  end

  def gallery
    @films = Film.promos.insert(0, @first_film)
  end

  def about
  end

end
