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
        Bundle.main.encode(data: recipes.map { $0.toRecipeDTO() }, to: "recipe.json")
        if let data = try? JSONEncoder().encode(recipes.map{$0.toRecipeDTO()}) {
            UserDefaults.standard.set(data, forKey: "myRecipes")
        }
    }
    
    func fetchMyRecipes() -> [Recipe] {
        guard let data = UserDefaults.standard.data(forKey: "myRecipes"),
              let myRecipesDTO = try? JSONDecoder().decode([RecipeDTO].self, from: data) else {
            return []
        }
        let myRecipes = myRecipesDTO.map{$0.toRecipe()}
        return myRecipes
    }

    func addRecipe(recipe: Recipe) {
        var recipes = getRecipes()
        if !recipes.contains(where: { $0.id == recipe.id }) {
            recipes.append(recipe)
            saveRecipe(recipes: recipes)
        }
    }
}
