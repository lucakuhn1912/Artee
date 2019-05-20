class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home]
  def home
    @arts = Art.all
  end
end
