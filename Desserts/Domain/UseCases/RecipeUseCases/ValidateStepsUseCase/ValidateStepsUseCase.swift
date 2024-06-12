//
//  ValidateStepsUseCase.swift
//  Desserts
//
//  Created by Maria Paula Gonzalez Escallon on 29/05/24.
//

import Foundation
class ValidateStepsUseCase: ValidateStepsUseCaseProtocol {
    
    private let hasNewLine: HasNewLineUseCaseProtocol
    private let isValidStringLength: IsValidStringLengthUseCaseProtocol
    
    init(hasNewLine: HasNewLineUseCaseProtocol, isValidStringLength: IsValidStringLengthUseCaseProtocol) {
        self.hasNewLine = hasNewLine
        self.isValidStringLength = isValidStringLength
    }
    
    func execute(steps: String) -> String {
        var rta: String = ""
        
        if !isValidStringLength.execute(str: steps, maxLength: 1000) || !hasNewLine.execute(str: steps) {
            rta = ErrorString.Steps.id
        }
        return rta
    }
}
