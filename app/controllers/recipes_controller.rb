class RecipesController < ApplicationController
  def show
    id = params[:id]
    @recipe = Recipe.find(id)
  end

  def new
    @recipe = Recipe.new()
    @cuisines = Cuisine.all()
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.valid?
      flash[:sucess] = 'Receita cadastrada com sucesso'
      @recipe.save
      redirect_to recipe_path(@recipe.id)
    else
      flash[:warning] = 'Você deve informar todos os dados da receita'
      @cuisines = Cuisine.all
      render 'new'
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title, :recipe_type, :cuisine_id, :difficulty, :cook_time, :ingredients, :cook_method)
  end
end