//
//  IsValidNumberUseCase.swift
//  Desserts
//
//  Created by Maria Paula Gonzalez Escallon on 27/05/24.
//

import Foundation

class IsValidNumberUseCase: IsValidNumberUseCaseProtocol {
    func execute(num: String, maxNum: Int) -> Bool {
        guard let number = Double(num) else {
            return false
        }
        
        return number > 0 && number <= Double(maxNum)
    }
}
