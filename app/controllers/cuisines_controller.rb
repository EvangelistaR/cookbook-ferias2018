class CuisinesController < ApplicationController
  def show
    id = params[:id]
    @cuisine = Cuisine.find(id)

    if @cuisine.recipes.length == 0
      flash[:warning] = 'Nenhuma receita encontrada para este tipo de cozinha'
    end
  end 

  def new
    @cuisine = Cuisine.new()
  end

  def create
    @cuisine = Cuisine.new(cuisine_params)
    if @cuisine.valid?
      flash[:sucess] = 'Cozinha cadastrada com sucesso'
      @cuisine.save
      redirect_to cuisine_path(@cuisine.id)
    else
      flash[:warning] = 'Você deve informar o nome da cozinha'
      render 'new'
    end   
  end

  private
  def cuisine_params
    params.require(:cuisine).permit(:name)
  end
end