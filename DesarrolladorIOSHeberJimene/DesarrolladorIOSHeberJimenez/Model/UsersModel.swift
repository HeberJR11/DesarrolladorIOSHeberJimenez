//
//  UsersModel.swift
//  DesarrolladorIOSHeberJimenez
//
//  Created by Heber  on 08/04/23.
//

import Foundation
import CoreData

class UserModel {
    
    // Creacion del contenedor
    let persistentContainer: NSPersistentContainer = {
        
        // Se crea un contenedor de nuestra base de datos
        let container = NSPersistentContainer(name: "UsersApp")
        
        // Si no logra crear el contenedor, se trabaja con el error
        container.loadPersistentStores {
            _, error in
            if let error = error {
                fatalError("No existe el contenedor \(error)")
            }
        }
        
        // Si si se logra crear el contenedor, lo devuelve
        return container
    }()
    
    // Variable global donde se almacenaran todos los Usuarios creados
    var users: [UserEntity] = []
    
    // Variable global que retendra el Usuario seleccionado
    var userSelected: UserEntity?
    
    // Variable global que retendra el index(posicion) del Usuario seleccionado
    var userSelectedIndex: Int?
    
    // Metodo para seleccionar un susario de todos los existentes, para posteriormente trabajar sobre el (actualizar o eliminar)
    func selectUser(index: Int, user: UserEntity) {
        
        self.userSelected = user
        self.userSelectedIndex = index
        
    }
    
    // Funcion para cargar los Usuarios existentes en nuestro contenedor
    func loadUsers() {
        
        let context = self.persistentContainer.viewContext
        
        let requestUsers = UserEntity.fetchRequest()
        
        if let users = try? context.fetch(requestUsers) {
            
            self.users = users
            
        }
        
    }
    
    func getUser(index: Int) -> UserEntity? {
        
        guard index >= 0 && index < self.users.count else { return nil }
        
        return self.users[index]
        
    }
    
    func addUser(nombre: String, apellidoPaterno: String, apellidoMaterno: String, correo: String, telefono: String) -> UserEntity? {
        
        print("Agregando al usuario: \(nombre) \(apellidoPaterno)")
        
        let context = self.persistentContainer.viewContext
        
        let usuario = UserEntity(context: context)
        
        usuario.nombre = nombre
        usuario.apellidoPaterno = apellidoPaterno
        usuario.apellidoMaterno = apellidoMaterno
        usuario.correo = correo
        usuario.telefono = telefono
        
        do {
            try context.save()
            self.loadUsers()
            return usuario
        } catch {
            context.rollback()
            return nil
        }
        
    }
    
    func updateUser(index: Int, nombre: String, apellidoPaterno: String, apellidoMaterno: String, correo: String, telefono: String) -> UserEntity? {
        
        if let user = self.getUser(index: index) {
            
            user.nombre = nombre
            user.apellidoPaterno = apellidoPaterno
            user.apellidoMaterno = apellidoMaterno
            user.correo = correo
            user.telefono = telefono
            
            let context = self.persistentContainer.viewContext
            
            do {
                try context.save()
                self.loadUsers()
                return user
            } catch {
                context.rollback()
            }
            
        }
        
        return nil
        
    }
    
    func deleteUser(index: Int) -> UserEntity? {
        
        if let user = self.getUser(index: index) {
            
            let context = self.persistentContainer.viewContext
            
            context.delete(user)
            
            do {
                try context.save()
                self.loadUsers()
                return user
            } catch {
                context.rollback()
            }
            
        }
        
        return nil
        
    }
    
}
