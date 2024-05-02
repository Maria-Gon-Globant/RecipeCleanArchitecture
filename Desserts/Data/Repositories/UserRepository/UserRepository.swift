//
//  UserRepository.swift
//  Desserts
//
//  Created by Maria Paula Gonzalez Escallon on 2/05/24.
//

import Foundation
protocol UserRepository {
    func getUser(completion: @escaping (Result<[User], Error>) -> Void)
}
