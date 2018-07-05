class Recipe < ApplicationRecord
  belongs_to :cuisine
  validates :recipe_type, :cuisine, :difficulty, :cook_time, presence: { message: 'Você deve informar todos os dados da receita'}
end
