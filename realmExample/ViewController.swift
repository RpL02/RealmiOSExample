//
//  ViewController.swift
//  realmExample
//
//  Created by Raul Palacios on 11/10/17.
//  Copyright © 2017 Raul Palacios. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    fileprivate let userPresenter = UserPresenter()
    @IBOutlet weak var usersTable: UITableView!
    
    let list = ["Goku", "Vegeta", "Gohan"]
    
    var users : Results<UserEntity>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userPresenter.attachView(self)
        userPresenter.getUsers()
    print(Realm.Configuration.defaultConfiguration.fileURL!)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
//        cell.textLabel?.text = list[indexPath.item]
        cell.textLabel?.text = users[indexPath.item].value(forKey: "name") as? String
        return cell
    }

    @IBAction func toNewUser() {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "newUser") as! NewUserViewController
        self.navigationController?.pushViewController(newViewController, animated: true)
    }
    
    @IBAction func reloadUsers() {
         userPresenter.getUsers()
    }

    
    
    
}

extension ViewController: UsersView{
    func userSaved(_ response: Bool) {}
    
    func setUsers(_ users: Results<UserEntity>){
        self.users = users
        self.usersTable.reloadData()
    }

}
