//
//  DefaultIsFavoriteUseCase.swift
//  Desserts
//
//  Created by Maria Paula Gonzalez Escallon on 25/04/24.
//

import Foundation
class DefaultIsFavoriteUseCase: IsFavoriteUseCase {
    private let repository: FavoriteRepository
    
    init(repository: FavoriteRepository) {
        self.repository = repository
    }

    func isFavorite(recipe: Recipe) -> Bool {
        repository.isFavorite(recipe: recipe)
    }
    
}
