class FlatsController < ApplicationController
  before_action :set_flat, only: [:show, :edit, :update, :destroy]

  def index
    @flats = Flat.all
  end

  def show
  end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(flat_params)  # On utilise flat_params ici
    if @flat.save
      redirect_to flats_path, notice: 'Flat was successfully created.'  # Message de confirmation après création
    else
      render :new  # Si la création échoue, on retourne à la vue new
    end
  end

  def edit
  end

  def update
    if @flat.update(flat_params)  # On s'assure que la mise à jour réussit avant de rediriger
      redirect_to flat_path(@flat), notice: 'Flat was successfully updated.'  # Message de confirmation après mise à jour
    else
      render :edit  # Si la mise à jour échoue, on reste sur la page edit
    end
  end

  def destroy
    @flat.destroy
    redirect_to flats_url, notice: 'Flat was successfully destroyed.'
  end

  private

  def set_flat
    @flat = Flat.find(params[:id])
  end

  def flat_params
    params.require(:flat).permit(:name, :address, :description, :price_per_night, :number_of_guests)
  end
end
