//
//  UserDTO.swift
//  Desserts
//
//  Created by Maria Paula Gonzalez Escallon on 2/05/24.
//

import Foundation
struct UserDTO: Codable{
    var id: Int
    var name: String
    var email: String
    var password: String
}

struct UsersContainerDTO: Decodable {
    let users: [UserDTO]
}
