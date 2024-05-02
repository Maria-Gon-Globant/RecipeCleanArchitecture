//
//  DefaultAddFavoriteUseCase.swift
//  Desserts
//
//  Created by Maria Paula Gonzalez Escallon on 25/04/24.
//

import Foundation
class DefaultAddFavoriteUseCase: AddFavoriteUseCase {
    private let repository: FavoriteRepository
    
    init(repository: FavoriteRepository) {
        self.repository = repository
    }

    func addFavorite(recipe: Recipe) {
        repository.addFavorite(recipe: recipe)
    }
}
