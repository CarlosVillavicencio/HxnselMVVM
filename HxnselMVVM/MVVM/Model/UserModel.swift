//
//  UserModel.swift
//  HxnselMVVM
//
//  Created by Carlos V on 17/02/23.
//

import Foundation

struct UserModel {
    let name: String
    let lastName: String
    
    
    static func getUsers() -> [UserModel] {
        return (1..<50).map({UserModel(name: "Hxnsel", lastName: "Kuro \($0)")})
    }
}
