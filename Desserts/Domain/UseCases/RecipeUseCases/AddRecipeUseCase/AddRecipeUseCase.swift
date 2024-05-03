//
//  AddRecipeUseCase.swift
//  Desserts
//
//  Created by Maria Paula Gonzalez Escallon on 2/05/24.
//

import Foundation
protocol AddRecipeUseCase {
    func execute(recipe: Recipe) -> Void
}
