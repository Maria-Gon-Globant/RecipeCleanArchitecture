//
//  IsValidStringLengthUseCase.swift
//  Desserts
//
//  Created by Maria Paula Gonzalez Escallon on 27/05/24.
//

import Foundation
class IsValidStringLengthUseCase: IsValidStringLengthUseCaseProtocol {
    func execute(str: String, maxLength: Int) -> Bool {
        let count = str.filter{ $0 != "\n" }.count
        return count >= 5 && count <= maxLength && !str.isEmpty
    }
}
