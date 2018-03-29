class Client::ClientController < ApplicationController
  before_action :authenticate_user!
end
