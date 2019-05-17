class PagesController < ApplicationController
  def home
    @arts = Art.all
  end
end
