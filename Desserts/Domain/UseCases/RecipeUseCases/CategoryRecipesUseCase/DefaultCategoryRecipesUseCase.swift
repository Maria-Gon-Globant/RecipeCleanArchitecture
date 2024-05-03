//
//  DefaultCategoryRecipesUseCase.swift
//  Desserts
//
//  Created by Maria Paula Gonzalez Escallon on 30/04/24.
//

import Foundation
class DefaultCategoryRecipesUseCase: CategoryRecipesUseCase {
    
    private var recipes: [Recipe] = []
    private let getRecipesUseCase: GetRecipesUseCase

    init(getRecipesUseCase: GetRecipesUseCase) {
        self.getRecipesUseCase = getRecipesUseCase
        getRecipes()
    }
    
    private func getRecipes(){
        recipes = getRecipesUseCase.execute()
    }
    
    func execute(category: String) -> [Recipe] {
        return category == "All" ? recipes : recipes.filter {$0.category.lowercased().contains(category.lowercased())}
    }
}
