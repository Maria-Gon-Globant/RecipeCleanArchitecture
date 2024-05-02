//
//  UserMapper.swift
//  Desserts
//
//  Created by Maria Paula Gonzalez Escallon on 2/05/24.
//

import Foundation
extension UserDTO {
    func toUser() -> User {
        User(
            id: id,
            name: name,
            email: email,
            password: password
        )
    }
}

extension User {
    func toUserDTO() -> UserDTO {
        UserDTO(
            id: self.id,
            name: self.name,
            email: self.email,
            password: self.password
        )
    }
}
