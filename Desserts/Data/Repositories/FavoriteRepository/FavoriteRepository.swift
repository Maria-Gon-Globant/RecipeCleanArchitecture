//
//  FavoriteRepository.swift
//  Desserts
//
//  Created by Maria Paula Gonzalez Escallon on 25/04/24.
//

import Foundation
protocol FavoriteRepository {
    func fetchFavorites() -> [Recipe]
    func saveFavorites(recipes: [Recipe])
    func addFavorite(recipe: Recipe)
    func removeFavorite(recipe: Recipe)
    func isFavorite(recipe: Recipe) -> Bool
}
