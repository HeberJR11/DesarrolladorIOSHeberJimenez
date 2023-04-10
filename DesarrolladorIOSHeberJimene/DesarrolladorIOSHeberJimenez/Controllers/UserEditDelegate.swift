//
//  UserEditDelegate.swift
//  DesarrolladorIOSHeberJimenez
//
//  Created by Heber  on 08/04/23.
//

import Foundation

protocol UserEditDelegate {
    
    func user(userUpdated user: UserEntity)
    
    func user(userEdited user: UserEntity)
    
    func user(userEditError message: String)
    
    func user(userDeleted user: UserEntity)
    
}
