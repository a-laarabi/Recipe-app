class RecipesController < ApplicationController
  # load_and_authorize_resource
  before_action :set_recipe, only: %i[show edit update destroy]

  def index
    @recipes = current_user.recipes
    @recipe = Recipe.find_by(id: params[:id])
  end

  def show; end

  def new
    @recipes = current_user.recipes.includes(:foods)
  end

  def destroy
    @recipe = Recipe.find_by(id: params[:id])
    @recipe.destroy

    respond_to do |format|
      format.html { redirect_to recipes_url, notice: 'Recipe was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def edit; end

  def create
    @recipe = current_user.recipes.new(recipe_params)

    respond_to do |format|
      if @recipe.save
        format.html { redirect_to recipe_url(@recipe), notice: 'Recipe was successfully created.' }
        format.json { render :show, status: :created, location: @recipe }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public)
  end
end
