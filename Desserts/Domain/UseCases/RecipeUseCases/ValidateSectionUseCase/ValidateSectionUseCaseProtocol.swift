//
//  ValidateSectionUseCaseProtocol.swift
//  Desserts
//
//  Created by Maria Paula Gonzalez Escallon on 29/05/24.
//

import Foundation
protocol ValidateSectionUseCaseProtocol {
    func execute(name: String, portion: String, time: String, image: String) -> String
}
