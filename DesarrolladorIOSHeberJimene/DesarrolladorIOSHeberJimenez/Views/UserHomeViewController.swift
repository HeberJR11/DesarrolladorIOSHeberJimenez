//
//  UserHomeViewController.swift
//  DesarrolladorIOSHeberJimenez
//
//  Created by Heber  on 08/04/23.
//

import UIKit

class UserHomeViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    // Variable global donde se guardaran los "Usuarios"
    var users: [UserEntity] = []
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        UserController.shared.homeDelegate = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        UserController.shared.getUsers()
        
    }

}

extension UserHomeViewController: UserHomeDelegate {
    
    func user(usersUpdated users: [UserEntity]) {
        self.users = users
        self.tableView.reloadData()
    }
    
}

extension UserHomeViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Users"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell")!
        
        let user = self.users[indexPath.row]
        
        var config = cell.defaultContentConfiguration()
        
        if let nombre = user.nombre {
            
            config.text = "\(nombre) "
            
        }
        
        cell.contentConfiguration = config
        return cell
        
    }
    
}

extension UserHomeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let user = self.users[indexPath.row]
        
        self.performSegue(withIdentifier: "UserDetailsSegue", sender: nil)
        
        UserController.shared.selectUser(index: indexPath.row, user: user)
        
    }
    
}
