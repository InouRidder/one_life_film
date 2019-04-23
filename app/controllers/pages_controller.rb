class PagesController < ApplicationController
  breadcrumb 'Home', :root
  before_action :add_breadcrumb_to_action, except: [ :home, :robots ]
  skip_before_action :authenticate_user!


  def home
  end

  def gallery

  end

  def about
  end

  def wedding
  end

  def robots
    respond_to :text
  end

  private

  def add_breadcrumb_to_action
    breadcrumb params[:action]&.capitalize, send("#{params[:action]}_path")
  end
end
