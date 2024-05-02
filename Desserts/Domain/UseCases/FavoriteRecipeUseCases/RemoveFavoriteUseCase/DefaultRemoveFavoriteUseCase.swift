//
//  DefaultRemoveFavoriteUseCase.swift
//  Desserts
//
//  Created by Maria Paula Gonzalez Escallon on 25/04/24.
//

import Foundation
class DefaultRemoveFavoriteUseCase: RemoveFavoriteUseCase {
    private let repository: FavoriteRepository
    
    init(repository: FavoriteRepository) {
        self.repository = repository
    }

    func removeFavorite(recipe: Recipe) {
        repository.removeFavorite(recipe: recipe)
    }
}
