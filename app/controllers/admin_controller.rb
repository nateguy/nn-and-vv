class AdminController < ApplicationController
  before_action :authenticate_user!
  def index
    @guests = Party::Guest.all
  end
end
