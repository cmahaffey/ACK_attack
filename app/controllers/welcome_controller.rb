class WelcomeController < ApplicationController
  include SessionsHelper

  def about
    @user = current_user
  end

  def index
    @home_page = true
  end

def search
  @user = current_user
end
end
