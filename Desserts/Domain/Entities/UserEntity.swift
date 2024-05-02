//
//  UserEntity.swift
//  Desserts
//
//  Created by Maria Paula Gonzalez Escallon on 2/05/24.
//

import Foundation
struct User: Identifiable, Hashable {
    var id: Int
    var name: String
    var email: String
    var password: String
}
