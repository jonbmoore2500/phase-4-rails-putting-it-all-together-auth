class RecipesController < ApplicationController
    

    def create
        recipe = @current_user.recipes.create(recipe_params)
        #render json: recipe, status: :created
        if recipe.valid?
            render json: recipe, status: :created
        else
            #byebug
            render json: {errors: recipe.errors.full_messages}, status: :unprocessable_entity
        end
    end

    def index
        recipes = Recipe.all 
        render json: recipes, status: :created
    end
   
    private

    def recipe_params
        params.permit(:title, :instructions, :minutes_to_complete, :user_id)
        #params.permit(:title, :instructions, :minutes_to_complete)
    end

end