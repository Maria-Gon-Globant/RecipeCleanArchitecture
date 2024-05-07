//
//  DefaultFilteredRecipeUseCase.swift
//  Desserts
//
//  Created by Maria Paula Gonzalez Escallon on 29/04/24.
//

import Foundation
class DefaultFilteredRecipeUseCase: FilteredRecipeUseCase {
    private var recipes: [Recipe] = []
    private let categoryRecipes: CategoryRecipesUseCase

    init(categoryRecipes: CategoryRecipesUseCase) {
        self.categoryRecipes = categoryRecipes
    }
    
    private func getRecipes(category: String){
        recipes = categoryRecipes.execute(category: category)
    }
    func execute(searchText: String, category: String) -> [Recipe] {
        getRecipes(category: category)
        
        return searchText == "" ? recipes : recipes.filter {$0.name.lowercased().contains(searchText.lowercased())}
    }
}
