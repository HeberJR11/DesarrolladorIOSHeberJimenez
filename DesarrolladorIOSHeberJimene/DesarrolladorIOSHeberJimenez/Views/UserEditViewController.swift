//
//  UserEditViewController.swift
//  DesarrolladorIOSHeberJimenez
//
//  Created by Heber  on 08/04/23.
//

import UIKit

class UserEditViewController: UIViewController {
    
    @IBOutlet weak var nombreTextField: UITextField!
    @IBOutlet weak var apellidoPaternoTextField: UITextField!
    @IBOutlet weak var apellidoMaternoTextField: UITextField!
    @IBOutlet weak var correoTextField: UITextField!
    @IBOutlet weak var telefonoTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UserController.shared.editDelegate = self
        
        UserController.shared.getSelectedUser()
        
    }
    
    @IBAction func saveAction(_ sender: Any) {
        
        guard let nombre = nombreTextField.text else {
            return
        }
        
        guard let apellidoPaterno = apellidoPaternoTextField.text else {
            return
        }
        
        guard let apellidoMaterno = apellidoMaternoTextField.text else {
            return
        }
        
        guard let correo = correoTextField.text else {
            return
        }
        
        guard let telefono = telefonoTextField.text else {
            return
        }
        
        UserController.shared.updateUser(nombre: nombre, apellidoPaterno: apellidoPaterno, apellidoMaterno: apellidoMaterno, correo: correo, telefono: telefono)
    }
    
    @IBAction func deleteAction(_ sender: Any) {
        
        UserController.shared.deleteUser()
        
    }
}

extension UserEditViewController: UserEditDelegate {
    
    func user(userUpdated user: UserEntity) {
        
        nombreTextField.text = user.nombre
        apellidoPaternoTextField.text = user.apellidoPaterno
        apellidoMaternoTextField.text = user.apellidoMaterno
        correoTextField.text = user.correo
        telefonoTextField.text = user.telefono
        
    }
    
    func user(userEdited user: UserEntity) {
        
        self.navigationController?.popViewController(animated: true)
        
    }
    
    func user(userEditError message: String) {
        
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        
        self.present(alert, animated: true)
        
    }
    
    func user(userDeleted user: UserEntity) {
        
        self.navigationController?.popToRootViewController(animated: true)
    }
    

}
