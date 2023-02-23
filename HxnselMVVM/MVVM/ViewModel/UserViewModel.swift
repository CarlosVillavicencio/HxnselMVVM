//
//  UserViewModel.swift
//  HxnselMVVM
//
//  Created by Carlos V on 17/02/23.
//

import Foundation
import Combine

class UserViewModel {
    var userList: [UserModel] = []
    var reloadData = PassthroughSubject<Void, Error>()
    @Published var isLoading: Bool?
    
    func getUsers() {
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.userList = UserModel.getUsers()
            self.reloadData.send()
            self.isLoading = false
        }
    }
}
