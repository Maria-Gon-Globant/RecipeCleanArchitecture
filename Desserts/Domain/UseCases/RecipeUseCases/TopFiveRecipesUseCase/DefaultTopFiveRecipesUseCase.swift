//
//  DefaultTopFiveRecipesUseCase.swift
//  Desserts
//
//  Created by Maria Paula Gonzalez Escallon on 30/04/24.
//

import Foundation
class DefaultTopFiveRecipesUseCase: TopFiveRecipesUseCase {

    private var recipes: [Recipe] = []
    private let categoryRecipes: CategoryRecipesUseCase

    init(categoryRecipes: CategoryRecipesUseCase) {
        self.categoryRecipes = categoryRecipes
    }
    
    private func getRecipes(category: String){
        recipes = categoryRecipes.getRecipesByCategory(category: category)
    }
    
    func execute(category: String) -> [Recipe] {
        getRecipes(category: category)
        return Array(recipes.sorted{ $0.rate > $1.rate }.prefix(min(5, recipes.count)))
    }

}
