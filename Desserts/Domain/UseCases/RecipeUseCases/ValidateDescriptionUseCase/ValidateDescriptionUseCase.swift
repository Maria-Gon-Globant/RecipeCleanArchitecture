//
//  ValidateDescriptionUseCase.swift
//  Desserts
//
//  Created by Maria Paula Gonzalez Escallon on 29/05/24.
//

import Foundation
class ValidateDescriptionUseCase: ValidateDescriptionUseCaseProtocol {
    
    private let isValidStringLength: IsValidStringLengthUseCaseProtocol
    
    init(isValidStringLength: IsValidStringLengthUseCaseProtocol) {
        self.isValidStringLength = isValidStringLength
    }
    
    func execute(description: String) -> String {
        var rta: String = ""
        
        if !isValidStringLength.execute(str: description, maxLength: 200) {
            rta = ErrorString.Description.id
        }
        return rta
    }
}
