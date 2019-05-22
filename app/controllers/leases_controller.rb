class LeasesController < ApplicationController
  before_action :found_lease, only: %i[show destroy edit update]

  def index
    @leases = policy_scope(Lease).order(start: :desc).where(user: current_user)
  end

  def show
  end

  def new
    @lease = Lease.new
    @art = found_art
    @lease.art = @art
    @lease.user = current_user
    authorize @lease
  end

  def create
    @lease = Lease.new(lease_params)
    @lease.user = current_user
    @lease.art = found_art
    @lease.total_price = found_art.price * (@lease.end - @lease.start)
    authorize @lease
    if @lease.save
      redirect_to lease_path(@lease)
    else
      @art = @lease.art
      render :new
    end
  end

  def edit
  end

  def update
    if @lease.update(lease_params)
      redirect_to lease_path(@lease)
    else
      render :edit
    end
  end

  def destroy
    @lease.destroy
    redirect_to leases_path
  end

  private

  def found_art
    Art.find(params[:art_id])
  end

  def found_lease
    @lease = Lease.find(params[:id])
    authorize @lease
  end

  def lease_params
    params.require(:lease).permit(:start, :end)
  end

end
