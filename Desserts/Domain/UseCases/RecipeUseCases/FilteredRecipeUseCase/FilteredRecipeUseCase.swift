//
//  FilteredRecipeUseCase.swift
//  Desserts
//
//  Created by Maria Paula Gonzalez Escallon on 29/04/24.
//

import Foundation

protocol FilteredRecipeUseCase {
    func execute(searchText: String, category: String) -> [Recipe]
}
