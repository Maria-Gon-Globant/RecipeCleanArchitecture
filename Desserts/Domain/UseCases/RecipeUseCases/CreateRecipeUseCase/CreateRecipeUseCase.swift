//
//  CreateRecipeUseCase.swift
//  Desserts
//
//  Created by Maria Paula Gonzalez Escallon on 2/05/24.
//

import Foundation
protocol CreateRecipeUseCase {
    func createRecipe(name: String, description: String, ingredients: String, steps: String, level: String, portion: String, time: String, image: String, category: String) -> Recipe
}
