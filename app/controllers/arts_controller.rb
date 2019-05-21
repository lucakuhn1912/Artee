class ArtsController < ApplicationController
  before_action :set_art, only: %i[show edit update destroy]
  skip_before_action :authenticate_user!, only: %i[index show]
  def index
    @arts = policy_scope(Art).where.not(latitude: nil, longitude: nil)

    @markers = @arts.map do |art|
      {
        lat: art.latitude,
        lng: art.longitude
      }
    end
  end

  def show
    # set_art
    @review = Review.new
    authorize @review
    @reviews = Review.where(art:@art)
  end

  def new
    @art = Art.new
    authorize @art
  end

  def create
    @art = Art.new(art_params)
    authorize @art
    @art.owner = current_user if user_signed_in?
    if @art.save
      redirect_to arts_path
    else
      render :new
    end
  end

  def edit
    # set_art
  end

  def update
    # set_art
    if @art.update(art_params)
      redirect_to art_path(@art)
    else
      render :edit
    end
  end

  def destroy
    # set_art
    @art.destroy
    redirect_to arts_path
  end

  private

  def art_params
    params.require(:art).permit(:name, :description, :artist,
                                :location, :price, :value, :availability,
                                :picture)
  end

  def set_art
    @art = Art.find(params[:id])
    authorize @art
  end
end
