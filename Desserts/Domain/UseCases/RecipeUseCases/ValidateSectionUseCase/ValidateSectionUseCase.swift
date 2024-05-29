//
//  ValidateSectionUseCase.swift
//  Desserts
//
//  Created by Maria Paula Gonzalez Escallon on 29/05/24.
//

import Foundation
class ValidateSectionUseCase: ValidateSectionUseCaseProtocol {
    private let isValidNumber: IsValidNumberUseCaseProtocol
    private let isValidStringLength: IsValidStringLengthUseCaseProtocol
    
    init(isValidNumber: IsValidNumberUseCaseProtocol, isValidStringLength: IsValidStringLengthUseCaseProtocol) {
        self.isValidNumber = isValidNumber
        self.isValidStringLength = isValidStringLength
    }
    
    func execute(name: String, portion: String, time: String, image: String) -> String {
        var rta: String = ""
        if !isValidStringLength.execute(str: name, maxLength: 50) {
            rta = ErrorString.Name.id
        }
        else if !isValidNumber.execute(num: portion, maxNum: 20) {
            rta = ErrorString.Portion.id
        }
        else if !isValidNumber.execute(num: time, maxNum: 200) {
            rta = ErrorString.Time.id
        }
        else if !isValidStringLength.execute(str: image, maxLength: 200) {
            rta = ErrorString.Image.id
        }
        return rta
    }
}
