//
//  DefaultAddRecipeUseCase.swift
//  Desserts
//
//  Created by Maria Paula Gonzalez Escallon on 2/05/24.
//

import Foundation
class DefaultAddRecipeUseCase: AddRecipeUseCase {
    private let repository: RecipeRepository
    
    init(repository: RecipeRepository) {
        self.repository = repository
    }

    func addRecipe(recipe: Recipe) {
        repository.addRecipe(recipe: recipe)
    }
}
