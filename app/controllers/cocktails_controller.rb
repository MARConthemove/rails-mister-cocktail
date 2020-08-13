class CocktailsController < ApplicationController

  def index
    @cocktails = Cocktail.all
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)

    if @cocktail.save
      redirect_to cocktails_path(@cocktail)
    else
      render 'new'
    end
  end

  def show
    @cocktail = Cocktail.find(params[:id])
  end


  private

  def cocktail_params
    params.require(:cocktail).permit(:name, :doses, :ingredients)
  end

end
