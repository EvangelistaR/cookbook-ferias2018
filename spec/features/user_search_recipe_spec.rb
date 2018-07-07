require 'rails_helper'


  feature 'User search recipe ' do
    scenario 'successfully' do
      cuisine =  Cuisine.create(name: 'Brasileira')
      recipe_type = RecipeType.create(name: 'Entrada')
      Recipe.create(title: 'Bolo de Cenoura', recipe_type: recipe_type,
                            cuisine: cuisine, difficulty: 'Médio',
                            cook_time: 60,
                            cook_method: 'Cozinhe a cenoura, corte em pedaços pequenos, misture com o restante dos ingredientes',
                            ingredients: 'Farinha, açucar, cenoura')
                                  
      visit root_path                     
      fill_in 'Pesquisando por:', with: 'Bolo de Cenoura'
      click_on 'Pesquisar' 
      
      expect(page).to have_css('p', text: 'Bolo de Cenoura') 
      
    end
  end