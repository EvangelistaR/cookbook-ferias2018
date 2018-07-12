require 'rails_helper'

feature 'Visitor accesses login section' do
    scenario 'Successfully' do

     #criação de dados
     
     #simula a ação do usuário
        visit root_path

        fill_in 'User',  with: 'usertest'
        fill_in 'password', with: '123456'
        click_on 'Acessar'
        
     #expectativas
    end
end