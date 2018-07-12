class Recipe < ApplicationRecord
  belongs_to :cuisine
  belongs_to :recipe_type
  has_attached_file :photo
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/
  validates :title, presence: { message: 'Os campos não podem ficar em branco!'}
end
