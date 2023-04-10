//
//  UserAddViewController.swift
//  DesarrolladorIOSHeberJimenez
//
//  Created by Heber  on 08/04/23.
//

import UIKit

class UserAddViewController: UIViewController {

    @IBOutlet var nombreTextField: UITextField!
    @IBOutlet var apellidoPaternoTextField: UITextField!
    @IBOutlet var apellidoMaternoTextField: UITextField!
    @IBOutlet var correoTextField: UITextField!
    @IBOutlet var telefonoTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UserController.shared.addDelegate = self
    }
    
    @IBAction func addUserAction(_ sender: Any) {
       
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
        
        // - Validacion de campos vacios
        
        if nombre == "" {
            
            let alert = UIAlertController(title: "No se pudo guardar", message: "El nombre es requerido", preferredStyle: .alert)
            alert.addAction (
                UIAlertAction(title: "Aceptar", style: .default)
                )
            
            self.present(alert, animated: true)
            return
        }
        
        if apellidoPaterno == "" {
            
            let alert = UIAlertController(title: "No se pudo guardar", message: "El apellido paterno es requerido", preferredStyle: .alert)
            alert.addAction (
                UIAlertAction(title: "Aceptar", style: .default)
                )
            
            self.present(alert, animated: true)
            return
        }
        
        if apellidoMaterno == "" {
            
            let alert = UIAlertController(title: "No se pudo guardar", message: "El apellido materno es requerido", preferredStyle: .alert)
            alert.addAction (
                UIAlertAction(title: "Aceptar", style: .default)
                )
            
            self.present(alert, animated: true)
            return
        }
        
        if correo == "" {
            
            let alert = UIAlertController(title: "No se pudo guardar", message: "El correo es requerido", preferredStyle: .alert)
            alert.addAction (
                UIAlertAction(title: "Aceptar", style: .default)
                )
            
            self.present(alert, animated: true)
            return
        }
        
        if telefono == "" {
            
            let alert = UIAlertController(title: "No se pudo guardar", message: "El telefono es requerido", preferredStyle: .alert)
            alert.addAction (
                UIAlertAction(title: "Aceptar", style: .default)
                )
            
            self.present(alert, animated: true)
            return
        }
        
        UserController.shared.addUser(nombre: nombre, apellidoPaterno: apellidoPaterno, apellidoMaterno: apellidoMaterno, correo: correo, telefono: telefono)
    }

}

extension UserAddViewController: UserAddDelegate {
    
    func user(userCreated user: UserEntity) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func user(userCreateError message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        
        self.present(alert, animated: true)
    }

}
