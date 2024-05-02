//
//  RemoveFavoriteUseCase.swift
//  Desserts
//
//  Created by Maria Paula Gonzalez Escallon on 25/04/24.
//

import Foundation
protocol RemoveFavoriteUseCase {
    func removeFavorite(recipe: Recipe) -> Void
}
