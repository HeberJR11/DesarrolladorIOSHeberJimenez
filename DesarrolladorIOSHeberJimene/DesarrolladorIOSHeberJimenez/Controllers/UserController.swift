//
//  UserController.swift
//  DesarrolladorIOSHeberJimenez
//
//  Created by Heber  on 08/04/23.
//

import Foundation

class UserController {
    
    // Singleton
    static let shared = UserController()
    
    let model = UserModel()
    
    var homeDelegate: UserHomeDelegate?
    var addDelegate: UserAddDelegate?
    var detailDelegate: UserDetailDelegate?
    var editDelegate: UserEditDelegate?
    
    func selectUser(index: Int, user: UserEntity) {
        
        model.selectUser(index: index, user: user)
        detailDelegate?.user(userUpdated: user)
        
    }
    
    func getUsers() {
        
        self.model.loadUsers()
        
        homeDelegate?.user(usersUpdated: self.model.users)
        
    }
    
    
    func getSelectedUser() {
        
        if let user = self.model.userSelected {
            
            detailDelegate?.user(userUpdated: user)
            editDelegate?.user(userUpdated: user)
            
        }
        
    }
    
    func addUser(nombre: String, apellidoPaterno: String, apellidoMaterno: String, correo: String, telefono: String) {
        
        if let user = self.model.addUser(nombre: nombre, apellidoPaterno: apellidoPaterno, apellidoMaterno: apellidoMaterno, correo: correo, telefono: telefono) {
            
            homeDelegate?.user(usersUpdated: self.model.users)
            
            addDelegate?.user(userCreated: user)
            
        } else {
            
            addDelegate?.user(userCreateError: "No se pudo agregar el nuevo user")
            
        }
        
    }
    
    func updateUser(nombre: String, apellidoPaterno: String, apellidoMaterno: String, correo: String, telefono: String) {
        
        if let index = self.model.userSelectedIndex {
            
            if let user = self.model.updateUser(index: index, nombre: nombre, apellidoPaterno: apellidoPaterno, apellidoMaterno: apellidoMaterno, correo: correo, telefono: telefono) {
                
                homeDelegate?.user(usersUpdated: self.model.users)
                detailDelegate?.user(userUpdated: user)
                editDelegate?.user(userEdited: user)
                
            } else {
                
                editDelegate?.user(userEditError: "No se pudo editar el user")
                
            }
            
        } else {
            
            editDelegate?.user(userEditError: "No hay user seleccionado")
            
        }
        
    }
    
    func deleteUser() {
        
        if let index = self.model.userSelectedIndex {
            
            if let user = self.model.deleteUser(index: index ) {
                
                homeDelegate?.user(usersUpdated: self.model.users)
                editDelegate?.user(userDeleted: user)
                
            } else {
                
                editDelegate?.user(userEditError: "No se pudo elimar el user")
                
            }
            
        } else {
            
            editDelegate?.user(userEditError: "No hay user seleccionado")
            
        }
        
    }
    
}
