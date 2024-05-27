//
//  HasNewLineUseCase.swift
//  Desserts
//
//  Created by Maria Paula Gonzalez Escallon on 27/05/24.
//

import Foundation
class HasNewLineUseCase: HasNewLineUseCaseProtocol {
    func execute(str: String) -> Bool {
        return str.contains("\n")
    }
}
