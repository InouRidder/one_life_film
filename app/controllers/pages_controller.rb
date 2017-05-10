class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :gallery, :about, :contact ]

  def home
  end

  def gallery
    @films = Film.where(promo: true)[0..13]
  end

  def about
  end

end
