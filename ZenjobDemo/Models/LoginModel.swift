//
//  LoginModel.swift
//  ZenjobDemo
//
//  Created by Bhagyashree Haresh Khatri on 02/09/2019.
//  Copyright © 2019 Bhagyashree Haresh Khatri. All rights reserved.
//

import Foundation

class LoginModel {
    var username: String?
    var token_type: String?
    var access_token: String?
    var expires_in: Int?
    var refresh_token: String?
    var roles: [String] = []
    
    
    // MARK: Instance Method
    func loadFromDictionary(_ dict: [String: AnyObject]) {
        if let username = dict["username"] as? String {
            self.username = username
        }
        if let expires_in = dict["expires_in"] as? Int {
            self.expires_in = expires_in
        }
        if let token_type = dict["token_type"] as? String {
            self.token_type = token_type
        }
        if let access_token = dict["access_token"] as? String {
            self.access_token = access_token
        }
        if let refresh_token = dict["refresh_token"] as? String {
            self.refresh_token = refresh_token
        }
        if let roleList = dict["roles"] as? [String] {
            if(!roleList.isEmpty){
                for role in roleList{
                    roles.append(role)
                }
            }
        }
    }

    
    // MARK: Class Method
    class func build(_ dict: [String: AnyObject]) -> LoginModel {
        let user = LoginModel()
        user.loadFromDictionary(dict)
        return user
    }
    
}

