//
//  RecipeRepository.swift
//  Desserts
//
//  Created by Maria Paula  on 4/23/24.
//

import Foundation
protocol RecipeRepository {
    func getRecipes() -> [Recipe]
    func saveRecipe(recipes: [Recipe], myRecipes: [Recipe])
    func addRecipe(recipe: Recipe)
    func fetchMyRecipes() -> [Recipe]
}
