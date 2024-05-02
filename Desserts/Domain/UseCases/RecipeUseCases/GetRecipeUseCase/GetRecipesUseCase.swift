//
//  GetRecipesUseCase.swift
//  Desserts
//
//  Created by Maria Paula  on 4/23/24.
//

import Foundation

protocol GetRecipesUseCase {
    func execute() -> [Recipe]
}
