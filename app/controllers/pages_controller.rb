class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def home
  end

  def gallery
  end

  def about
  end

  def wedding
  end
end
