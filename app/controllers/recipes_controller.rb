class RecipesController < ApplicationController
  load_and_authorize_resource
  before_action :set_recipe, only: %i[show edit update destroy]

  def index
    @recipes = current_user.recipes
    @recipe = Recipe.find_by(id: params[:id])
  end

  def show; end

  def new
    @recipes = current_user.recipes.includes(:foods)
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end
end
