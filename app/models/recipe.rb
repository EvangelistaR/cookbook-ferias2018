class Recipe < ApplicationRecord
  belongs_to :cuisine
  belongs_to :recipe_type
  validates :title, :difficulty, :cook_time, presence: { message: 'Você deve informar todos os dados da receita'}
end
