//
//  LoginService.swift
//  ZenjobDemo
//
//  Created by Bhagyashree Haresh Khatri on 02/09/2019.
//  Copyright © 2019 Bhagyashree Haresh Khatri. All rights reserved.
//

import Foundation

class LoginService {
    
    public func callAPIPostLogin(userName:String,password:String,onSuccess successCallback: ((_ user: LoginModel) -> Void)?, onFailure failureCallback: ((_ errorMessage: String) -> Void)?) {
        APICallManager.instance.callAPIPostLogin(userName:userName,password:password,
            onSuccess: { (user) in
                successCallback?(user)
        },
            onFailure: { (errorMessage) in
                failureCallback?(errorMessage)
        }
        )
    }
}
