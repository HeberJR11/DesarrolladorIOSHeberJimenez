//
//  UserAddDelegate.swift
//  DesarrolladorIOSHeberJimenez
//
//  Created by Heber  on 08/04/23.
//

import Foundation

protocol UserAddDelegate {
    
    func user(userCreated user: UserEntity)
    
    func user(userCreateError message: String)
    
}
