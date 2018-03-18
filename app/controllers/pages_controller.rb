class PagesController < ApplicationController

  before_action :authenticate_user!

  skip_before_action :authenticate_user!, only: :welcome

  def welcome

  end

  def home

  end

end