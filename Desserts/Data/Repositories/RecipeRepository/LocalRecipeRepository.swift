//
//  LocalRecipeRepository.swift
//  Desserts
//
//  Created by Maria Paula  on 4/23/24.
//

import Foundation
class LocalRecipeRepository: RecipeRepository {
    
    func getRecipes() -> [Recipe] {
        let data: RecipesContainerDTO = Bundle.main.decode(file:JsonFiles.Recipe.id)
        return data.recipes.map { $0.toRecipe() }
    }
    
    func saveRecipe(recipes: [Recipe]) {
        Bundle.main.encode(data: recipes.map { $0.toRecipeDTO() }, key: JsonKeys.Recipe.id, to: JsonFiles.Recipe.id)
        Bundle.main.encode(data: recipes.map { $0.toRecipeDTO() }, key: JsonKeys.MyRecipes.id, to: JsonFiles.MyRecipes.id)
    }
    
    func fetchMyRecipes() -> [Recipe] {
        let data: RecipesContainerDTO = Bundle.main.decode(file: JsonFiles.MyRecipes.id)
        return data.recipes.map { $0.toRecipe() }
    }

    func addRecipe(recipe: Recipe) {
        var recipes = getRecipes()
        if !recipes.contains(where: { $0.id == recipe.id }) {
            recipes.append(recipe)
            saveRecipe(recipes: recipes)
        }
    }
}
