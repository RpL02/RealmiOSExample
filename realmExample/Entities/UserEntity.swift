//
//  UserEntity.swift
//  realmExample
//
//  Created by Raul Palacios on 11/10/17.
//  Copyright © 2017 Raul Palacios. All rights reserved.
//

import Foundation
import RealmSwift

class UserEntity: Object {
    @objc dynamic var id = 0
    @objc dynamic var name = ""
}
