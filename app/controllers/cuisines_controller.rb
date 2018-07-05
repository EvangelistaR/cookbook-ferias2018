class CuisinesController < ApplicationController
  def show
    id = params[:id]
    @cuisine = Cuisine.find(id)

    if @cuisine.recipes.length == 0
      flash[:warning] = 'Nenhuma receita encontrada para este tipo de cozinha'
    end
  end 
end