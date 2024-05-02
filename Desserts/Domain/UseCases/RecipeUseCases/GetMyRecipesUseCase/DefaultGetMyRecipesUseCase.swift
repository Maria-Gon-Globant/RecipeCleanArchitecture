//
//  DefaultGetMyRecipesUseCase.swift
//  Desserts
//
//  Created by Maria Paula Gonzalez Escallon on 2/05/24.
//

import Foundation
class DefaultGetMyRecipesUseCase: GetMyRecipesUseCase {
    private let repository: RecipeRepository
    
    init(repository: RecipeRepository) {
        self.repository = repository
    }
    func getMyRecipes() -> [Recipe] {
        return repository.fetchMyRecipes()
    }
}
