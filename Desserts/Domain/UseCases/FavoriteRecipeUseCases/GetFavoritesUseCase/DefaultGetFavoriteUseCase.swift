//
//  DefaultGetFavoriteUseCase.swift
//  Desserts
//
//  Created by Maria Paula Gonzalez Escallon on 25/04/24.
//

import Foundation
class DefaultGetFavoriteUseCase: GetFavoritesUseCase {
    private let repository: FavoriteRepository
    
    init(repository: FavoriteRepository) {
        self.repository = repository
    }

    func getFavorites() -> [Recipe] {
        return repository.fetchFavorites()
    }
}
