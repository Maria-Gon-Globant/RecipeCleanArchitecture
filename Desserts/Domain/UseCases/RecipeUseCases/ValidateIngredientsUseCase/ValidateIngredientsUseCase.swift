//
//  ValidateIngredientsUseCase.swift
//  Desserts
//
//  Created by Maria Paula Gonzalez Escallon on 29/05/24.
//

import Foundation
class ValidateIngredientsUseCase: ValidateIngredientsUseCaseProtocol {
    
    private let hasNewLine: HasNewLineUseCaseProtocol
    private let isValidStringLength: IsValidStringLengthUseCaseProtocol
    
    init(hasNewLine: HasNewLineUseCaseProtocol, isValidStringLength: IsValidStringLengthUseCaseProtocol) {
        self.hasNewLine = hasNewLine
        self.isValidStringLength = isValidStringLength
    }
    
    func execute(ingredients: String) -> String {
        var rta: String = ""
        
        if !isValidStringLength.execute(str: ingredients, maxLength: 1000) || !hasNewLine.execute(str: ingredients) {
            rta = ErrorString.Ingredients.id
        }
        return rta
    }
}
