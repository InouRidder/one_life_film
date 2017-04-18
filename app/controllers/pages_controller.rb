class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def portfolio
    @films = PromoFilm.where(promotion: true)
  end

end
