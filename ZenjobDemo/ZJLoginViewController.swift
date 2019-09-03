//
//  ZJLoginViewController.swift
//  ZenjobDemo
//
//  Created by Bhagyashree Haresh Khatri on 02/09/2019.
//  Copyright © 2019 Bhagyashree Haresh Khatri. All rights reserved.
//

import UIKit

class ZJLoginViewController: UIViewController {

    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    let presenter = LoginPresenter(loginService: LoginService())
    var username:String?
    var password:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        uiConfiguration()
    }
    
    func uiConfiguration(){
        userNameTextField.delegate = self
        passwordTextField.delegate = self
        activityIndicator?.hidesWhenStopped = true
        presenter.attachView(view: self)
    }
    
    func loginValidations(){
        if let name = username,name.isEmpty{
            showError(errorMessage: "Enter User Name")
        }
        
        else if let passcode = password,passcode.isEmpty{
            showError(errorMessage: "Enter Password")
        }
            
        else{
            presenter.loginAPI(userName: "mobile@zenjob.com", password: "becreative")
        }
    }
    
    @IBAction func loginAction(_ sender: UIButton) {
         loginValidations()
    }
}

//MARK: - Protocols Implementation
extension ZJLoginViewController: LoginView {
    
    func loginSuccess(users: LoginModel){
        if let token = users.access_token{
            ZJUserDefaults.accessToken = token
            performSegue(withIdentifier: Helpers.ZJDashboardSegue, sender: self)
        }
    }
    
    func startLoading() {
        // Show your loader
        activityIndicator?.startAnimating()
    }
    
    func finishLoading() {
        // Dismiss your loader
        activityIndicator?.stopAnimating()
    }
    
    func showError(errorMessage: String){
        Helpers.showToast(controller: self, message: errorMessage)
    }
}


extension ZJLoginViewController:UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let name = userNameTextField.text{
            username = name
        }
        if let passcode = passwordTextField.text{
            password = passcode
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
