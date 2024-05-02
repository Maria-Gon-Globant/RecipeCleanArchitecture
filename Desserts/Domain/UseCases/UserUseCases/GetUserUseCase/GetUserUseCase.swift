//
//  GetUserUseCase.swift
//  Desserts
//
//  Created by Maria Paula Gonzalez Escallon on 2/05/24.
//

import Foundation
protocol GetUserUseCase {
    func execute(completion: @escaping (Result<[User], Error>) -> Void)
}
