require 'rails_helper'

feature 'User edit recipe ' do
  # cria os dados necessários previamente
  scenario 'successfully' do
    cuisine = Cuisine.create(name: 'Brasileira')
    recipe_type = RecipeType.create(name: 'Sobremesa')
    RecipeType.create(name: 'Entrada')
    Cuisine.create(name: 'Arabe')
    recipe = Recipe.create(title: 'Bolo de cenoura', recipe_type: recipe_type,
                          cuisine: cuisine, difficulty: 'Médio',
                          cook_time: 60,
                          ingredients: 'Farinha, açucar, cenoura',
                          cook_method: 'Cozinhe a cenoura, corte em pedaços pequenos, misture com o restante dos ingredientes')
   # simula a ação do usuário
       visit root_path
       click_on recipe.title
       click_on 'Editar'
       
       fill_in 'Título', with: 'kebab'
       select 'Arabe', from: 'Cozinha'
       select 'Entrada', from: 'Tipo da Receita'
       fill_in 'Dificuldade', with: 'Fácil'
       fill_in 'Tempo de Preparo', with: '50'
       fill_in 'Ingredientes', with: 'Leite'
       fill_in 'Como Preparar', with: 'Não sei'
       click_on 'Salvar' 
       
       expect(page).to have_css('h1', text: 'kebab' )
       expect(page).to have_css('p', text: 'Entrada')
       expect(page).to have_css('p', text: 'Arabe')
       expect(page).to have_css('p', text: 'Fácil')
       expect(page).to have_css('p', text: '50')
       expect(page).to have_css('p', text: 'Leite')
       expect(page).to have_css('p', text: 'Não sei')

  end

  scenario 'and user dont edit recipe' do

    cuisine = Cuisine.create(name: 'Brasileira')
    recipe_type = RecipeType.create(name: 'Sobremesa')
    RecipeType.create(name: 'Entrada')
    Cuisine.create(name: 'Arabe')
    recipe = Recipe.create(title: 'Bolo de cenoura', recipe_type: recipe_type,
                          cuisine: cuisine, difficulty: 'Médio',
                          cook_time: 60,
                          ingredients: 'Farinha, açucar, cenoura',
                          cook_method: 'Cozinhe a cenoura, corte em pedaços pequenos, misture com o restante dos ingredientes')

    # simula a ação do usuário
    visit root_path
    click_on recipe.title
    click_on 'Editar'

    fill_in 'Título', with: ''
    fill_in 'Dificuldade', with: ''
    fill_in 'Tempo de Preparo', with: ''
    fill_in 'Ingredientes', with: ''
    fill_in 'Como Preparar', with: ''
    click_on 'Salvar'

    expect(page).to have_content('Os campos não podem ficar em branco!')
  end

end
