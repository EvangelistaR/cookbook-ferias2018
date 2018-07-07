class RecipesController < ApplicationController
  def show
    id = params[:id]
    @recipe = Recipe.find(id)
  end

  def new
    @recipe = Recipe.new
    @cuisines = Cuisine.all
    @recipe_types = RecipeType.all
  end

  def edit
    @recipe = Recipe.find(params[:id])
    @cuisines = Cuisine.all
    @recipe_types = RecipeType.all
  end

  def update
    @recipe = Recipe.find(params[:id])
    
    if @recipe.update(recipe_params)     
      redirect_to @recipe
    else
      @cuisines = Cuisine.all
      @recipe_types = RecipeType.all
      render 'edit'
    end
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      flash[:sucess] = 'Receita cadastrada com sucesso'
      redirect_to recipe_path(@recipe.id)
    else
      flash[:warning] = 'Você deve informar todos os dados da receita'
      @cuisines = Cuisine.all
      @recipe_types = RecipeType.all
      render 'new'
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title, :recipe_type_id, :cuisine_id, :difficulty, :cook_time, :ingredients, :cook_method)
  end
end