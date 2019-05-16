class ArtsController < ApplicationController
  before_action :set_art, only: %i[show edit update destroy]

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
    @owner = User.create(name: "TeeAr")
    @art = Art.new(art_params)
    @art.owner = current_user
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
  end
end
