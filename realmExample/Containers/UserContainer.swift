//
//  UserContainer.swift
//  realmExample
//
//  Created by Raul Palacios on 11/10/17.
//  Copyright © 2017 Raul Palacios. All rights reserved.
//

import Foundation
import RealmSwift

class UserContainer {
    
    func save(name: String, callback: @escaping (Bool) -> Void){
        let realm = try! Realm()
        let user = UserEntity()
        user.name = name
        
        try! realm.write {
            realm.add(user)
            callback(true)
        }
    }
    
//
    func getAll(callback: @escaping (Results<UserEntity>) -> Void){
        let realm = try! Realm()
        let users = realm.objects(UserEntity.self)
        
        callback(users)
        
    }
    
}
