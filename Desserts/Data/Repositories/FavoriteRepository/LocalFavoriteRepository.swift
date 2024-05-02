//
//  LocalFavoriteRepository.swift
//  Desserts
//
//  Created by Maria Paula Gonzalez Escallon on 25/04/24.
//

import Foundation
class LocalFavoriteRepository: FavoriteRepository {
    private let favoritesKey = "favorites"

    func fetchFavorites() -> [Recipe] {
        guard let data = UserDefaults.standard.data(forKey: favoritesKey),
              let favoritesDTO = try? JSONDecoder().decode([RecipeDTO].self, from: data) else {
            return []
        }
        let favorites = favoritesDTO.map{$0.toRecipe()}
        return favorites
    }

    func saveFavorites(recipes: [Recipe]) {
        if let data = try? JSONEncoder().encode(recipes.map{$0.toRecipeDTO()}) {
            UserDefaults.standard.set(data, forKey: favoritesKey)
        }
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
        var favorites = fetchFavorites()
        return favorites.contains(where: { $0.id == recipe.id })
    }
}
