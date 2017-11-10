//
//  NewUserViewController.swift
//  realmExample
//
//  Created by Raul Palacios on 11/10/17.
//  Copyright © 2017 Raul Palacios. All rights reserved.
//

import UIKit
import RealmSwift

class NewUserViewController: UIViewController {
    
    @IBOutlet weak var nameText: UITextField!
    fileprivate let userPresenter = UserPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userPresenter.attachView(self)
    }
    
    @IBAction func save() {
        userPresenter.saveUser(name: nameText.text!)
        nameText.text = ""
    }

}

extension NewUserViewController: UsersView{
    func setUsers(_ users: Results<UserEntity>){}
    func userSaved(_ response: Bool){
        if response == true {
            let alert = UIAlertController(title: "Saved", message: "The user was saved.", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Aceptar", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        let alert = UIAlertController(title: "Error", message: "The user wasn't saved.", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Aceptar", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
