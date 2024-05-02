//
//  LocalUserRepository.swift
//  Desserts
//
//  Created by Maria Paula Gonzalez Escallon on 2/05/24.
//

import Foundation
class LocalUserRepository: UserRepository {
    
    func getUser(completion: @escaping (Result<[User], Error>) -> Void) {
        let data: UsersContainerDTO = Bundle.main.decode(file:"users.json")
        let users = data.users.map { $0.toUser() }
        completion(.success(users))
    }
}
