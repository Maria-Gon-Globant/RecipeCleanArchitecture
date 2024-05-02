//
//  DefaultGetRecipesUseCase.swift
//  Desserts
//
//  Created by Maria Paula  on 4/23/24.
//

import Foundation
class DefaultGetRecipesUseCase: GetRecipesUseCase {
    private let recipeRepository: RecipeRepository

    init(recipeRepository: RecipeRepository) {
        self.recipeRepository = recipeRepository
    }

    func execute() -> [Recipe] {
        return recipeRepository.getRecipes()
    }
}
