//
//  IsValidNumberUseCaseProtocol.swift
//  Desserts
//
//  Created by Maria Paula Gonzalez Escallon on 27/05/24.
//

import Foundation
protocol IsValidNumberUseCaseProtocol {
    func execute(num: String, maxNum: Int) -> Bool
}
