//
//  LocalFavoriteRepository.swift
//  Desserts
//
//  Created by Maria Paula Gonzalez Escallon on 25/04/24.
//

import Foundation
class LocalFavoriteRepository: FavoriteRepository {

    func fetchFavorites() -> [Recipe] {
        let data: FavoritesContainerDTO = Bundle.main.decode(file: JsonFiles.Favorites.id)
        return data.favorites.map { $0.toRecipe() }
    }

    func saveFavorites(recipes: [Recipe]) {
        let data: FavoritesContainerDTO = Bundle.main.decode(file: JsonFiles.Favorites.id)
        Bundle.main.encode(data: recipes.map { $0.toRecipeDTO() }, key: JsonKeys.Favorites.id, to: JsonFiles.Favorites.id)
    }

    func addFavorite(recipe: Recipe) {
        var favorites = fetchFavorites()
        if !favorites.contains(where: { $0.id == recipe.id }) {
            favorites.append(recipe)
            saveFavorites(recipes: favorites)
        }
    }

    func removeFavorite(recipe: Recipe) {
        var favorites = fetchFavorites()
        favorites.removeAll(where: { $0.id == recipe.id })
        saveFavorites(recipes: favorites)
    }

    func isFavorite(recipe: Recipe) -> Bool {
        let favorites = fetchFavorites()
        return favorites.contains(where: { $0.id == recipe.id })
    }
}
