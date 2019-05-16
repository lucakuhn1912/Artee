class ArtsController < ApplicationController
  before_action :set_art, only: [:show, :edit, :update, :destroy]

  def index
    @arts = Art.all
  end

  def show
    # set_art
  end

  def new
    @art = Art.new
  end

  def create
    @art = Art.new(art_params)
  end

  def edit
    # set_art
  end

  def update
    # set_art
  end

  def destroy
    # set_art
  end

  private

  def art_params
    params.require(:art).permit(:name, :description,
     :artist, :location, :price, :value, :availability, :picture)
  end

  # for owner use current_user, do picture with cloudinary

  def set_art
    @art = Art.find(params[:id])
  end
end
