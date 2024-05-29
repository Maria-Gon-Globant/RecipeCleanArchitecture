//
//  IsValidStringLengthUseCaseProtocol.swift
//  Desserts
//
//  Created by Maria Paula Gonzalez Escallon on 27/05/24.
//

import Foundation
protocol IsValidStringLengthUseCaseProtocol {
    func execute(str: String, maxLength: Int) -> Bool
}
