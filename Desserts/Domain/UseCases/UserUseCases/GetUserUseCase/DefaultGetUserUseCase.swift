//
//  DefaultGetUserUseCase.swift
//  Desserts
//
//  Created by Maria Paula Gonzalez Escallon on 2/05/24.
//

import Foundation
class DefaultGetUserUseCase: GetUserUseCase {

    
    private let userRepository: UserRepository

    init(userRepository: UserRepository) {
        self.userRepository = userRepository
    }
    
    func execute(completion: @escaping (Result<[User], any Error>) -> Void) {
        userRepository.getUser(completion: completion)
    }

}
