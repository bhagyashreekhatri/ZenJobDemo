//
//  LoginPresenter.swift
//  ZenjobDemo
//
//  Created by Bhagyashree Haresh Khatri on 02/09/2019.
//  Copyright © 2019 Bhagyashree Haresh Khatri. All rights reserved.
//

import Foundation

protocol LoginView: NSObjectProtocol {
    func startLoading()
    func finishLoading()
    func showError(errorMessage: String)
    func loginSuccess(users: LoginModel)
}

class LoginPresenter {
    private let loginService:LoginService
    weak private var loginView : LoginView?
    
    init(loginService:LoginService) {
        self.loginService = loginService
    }
    
    func attachView(view:LoginView) {
        loginView = view
    }
    
    func detachView() {
        loginView = nil
    }
    
    func loginAPI(userName:String, password:String) {
        self.loginView?.startLoading()
        loginService.callAPIPostLogin(userName:userName, password:password,
            onSuccess: { (user) in
                DispatchQueue.main.async {
                    self.loginView?.finishLoading()
                    self.loginView?.loginSuccess(users: user)
                }
        },
            onFailure: { (errorMessage) in
                DispatchQueue.main.async {
                    self.loginView?.finishLoading()
                    self.loginView?.showError(errorMessage: errorMessage)
                }
        }
        )
    }
}
