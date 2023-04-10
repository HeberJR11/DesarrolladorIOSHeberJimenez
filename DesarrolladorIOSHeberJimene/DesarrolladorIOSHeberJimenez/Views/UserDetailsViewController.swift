//
//  UserDetailsViewController.swift
//  DesarrolladorIOSHeberJimenez
//
//  Created by Heber  on 08/04/23.
//

import UIKit

class UserDetailsViewController: UIViewController {

    @IBOutlet var nombreLabel: UILabel!
    @IBOutlet var apellidoPaternoLabel: UILabel!
    @IBOutlet var apellidoMaternoLabel: UILabel!
    @IBOutlet var correoLabel: UILabel!
    @IBOutlet var telefonoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UserController.shared.detailDelegate = self
        
        UserController.shared.getSelectedUser()
    }

}

extension UserDetailsViewController: UserDetailDelegate {
    
    func user(userUpdated: UserEntity) {
        
        if let user = UserController.shared.model.userSelected {
            nombreLabel.text = user.nombre
            apellidoPaternoLabel.text = user.apellidoPaterno
            apellidoMaternoLabel.text = user.apellidoMaterno
            correoLabel.text = user.correo
            telefonoLabel.text = user.telefono
        }
        
    }
    
}
