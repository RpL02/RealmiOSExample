//
//  UserPresenter.swift
//  realmExample
//
//  Created by Raul Palacios on 11/10/17.
//  Copyright © 2017 Raul Palacios. All rights reserved.
//

import Foundation
import RealmSwift

struct UserViewData {
    let name: String
}

protocol UsersView: NSObjectProtocol {
    func setUsers(_ users: Results<UserEntity>)
    func userSaved(_ response: Bool)
}

class UserPresenter {
    fileprivate var userContainer = UserContainer()
    weak fileprivate var usersView: UsersView?
    
    func attachView(_ view:UsersView){
        usersView = view
    }
    
    func getUsers(){
        userContainer.getAll(){(users) in
            if users.count > 0 {
                self.usersView?.setUsers(users)
            }
        }
    }
    
    func saveUser(name: String){
        userContainer.save(name: name){(response) in
            self.usersView?.userSaved(response)
        }
    }
}
