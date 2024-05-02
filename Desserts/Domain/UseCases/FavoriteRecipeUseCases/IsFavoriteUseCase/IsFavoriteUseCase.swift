//
//  IsFavoriteUseCase.swift
//  Desserts
//
//  Created by Maria Paula Gonzalez Escallon on 25/04/24.
//

import Foundation
protocol IsFavoriteUseCase {
    func isFavorite(recipe: Recipe) -> Bool
}
