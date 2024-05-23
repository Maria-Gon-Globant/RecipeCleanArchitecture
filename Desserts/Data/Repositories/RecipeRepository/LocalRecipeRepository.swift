//
//  LocalRecipeRepository.swift
//  Desserts
//
//  Created by Maria Paula  on 4/23/24.
//

import Foundation
class LocalRecipeRepository: RecipeRepository {
    
    func getRecipes() -> [Recipe] {
        let data: RecipesContainerDTO = Bundle.main.decode(file:"recipe.json")
        return data.recipes.map { $0.toRecipe() }
    }
    
    func saveRecipe(recipes: [Recipe]) {
        Bundle.main.encode(data: recipes.map { $0.toRecipeDTO() }, key: "recipe", to: "recipe.json")
        Bundle.main.encode(data: recipes.map { $0.toRecipeDTO() }, key: "myRecipes", to: "myRecipes.json")
    }
    
    func fetchMyRecipes() -> [Recipe] {
        let data: RecipesContainerDTO = Bundle.main.decode(file:"myRecipes.json")
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
