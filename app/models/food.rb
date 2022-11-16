class Food < ApplicationRecord
  belongs_to :user
  has_many :recipes, through: :recipe_foods
  has_many :recipe_foods, dependent: :destroy
end
