//
//  TopFiveRecipesUseCase.swift
//  Desserts
//
//  Created by Maria Paula Gonzalez Escallon on 30/04/24.
//

import Foundation
protocol TopFiveRecipesUseCase {
    func execute(category: String) -> [Recipe]
}
