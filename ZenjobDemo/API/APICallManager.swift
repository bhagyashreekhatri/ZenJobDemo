//
//  APICallManager.swift
//  ZenjobDemo
//
//  Created by Bhagyashree Haresh Khatri on 02/09/2019.
//  Copyright © 2019 Bhagyashree Haresh Khatri. All rights reserved.
//

import Alamofire
import SwiftyJSON
import Foundation

let API_BASE_URL = "https://staging-main.zenjob.org"

class APICallManager {
    static let instance = APICallManager()
    
    enum RequestMethod {
        case get
        case post
    }
    
    enum Endpoint: String {
        case Login = "/api/employee/v1/auth"
        case Offers = "/api/employee/v1/offers"
    }
    
    
    // MARK: POST LOGIN API
    func callAPIPostLogin(userName:String,password:String, onSuccess successCallback: ((_ user: LoginModel) -> Void)?, onFailure failureCallback: ((_ errorMessage: String) -> Void)?) {
        
        
        // Build URL
        let url = API_BASE_URL + Endpoint.Login.rawValue
        
        // Build Headers
        let loginHeaders = ["Content-Type": "application/json"]
        
        // Build Params
        let loginParams = [
            "username"      : userName,
            "password"      : password
            ] as [String : Any]
        
        // call API
        self.createRequest(
            url, method: .post, headers: loginHeaders, parameters: loginParams,
            onSuccess: {(responseObject: JSON) -> Void in
                // Create dictionary
                if let responseDict = responseObject.dictionaryObject {
                    let loginDict = responseDict as [String : AnyObject]
                    let data =  LoginModel.build(loginDict)
                    
                    // Fire callback
                    successCallback?(data)
                } else {
                    failureCallback?("An error has occured.")
                }
        },
            onFailure: {(errorMessage: String) -> Void in
                failureCallback?(errorMessage)
        }
        )
    }
    
    // MARK: GET OFFERS LIST API
    func callAPIGetOffers(offset:String, onSuccess successCallback: ((_ offers: OffersModel) -> Void)?, onFailure failureCallback: ((_ errorMessage: String) -> Void)?) {
        
        
        // Build URL
        let url = API_BASE_URL + Endpoint.Offers.rawValue + "?offset=" + offset
        
        // Build Headers
        guard let token = ZJUserDefaults.accessToken else {
            return
        }
        let loginHeaders = ["Authorization": "Bearer \(token)"]
        
        // call API
        self.createRequest(
            url, method: .get, headers: loginHeaders, parameters: nil,
            onSuccess: {(responseObject: JSON) -> Void in
                // Create dictionary
                if let responseDict = responseObject.dictionaryObject {
                    let offersDict = responseDict as [String : AnyObject]
                    let data =  OffersModel.build(offersDict)
                    
                    // Fire callback
                    successCallback?(data)
                } else {
                    failureCallback?("An error has occured.")
                }
        },
            onFailure: {(errorMessage: String) -> Void in
                failureCallback?(errorMessage)
        }
        )
    }
    
    // MARK: GET OFFERS DETAILS API
    func callAPIGetOfferDetails(id:String, onSuccess successCallback: ((_ offer: OfferList) -> Void)?, onFailure failureCallback: ((_ errorMessage: String) -> Void)?) {
        
        
        // Build URL
        let url = API_BASE_URL + Endpoint.Offers.rawValue + "/" + id
        
        // Build Headers
        guard let token = ZJUserDefaults.accessToken else {
            return
        }
        let loginHeaders = ["Authorization": "Bearer \(token)"]
        
        // call API
        self.createRequest(
            url, method: .get, headers: loginHeaders, parameters: nil,
            onSuccess: {(responseObject: JSON) -> Void in
                
                
                // Create dictionary
                if let responseDict = responseObject.dictionaryObject {
                    let offersDict = responseDict as [String : AnyObject]
                    let data =  OfferList.build(offersDict)
                    
                    // Fire callback
                    successCallback?(data)
                } else {
                    failureCallback?("An error has occured.")
                }
        },
            onFailure: {(errorMessage: String) -> Void in
                failureCallback?(errorMessage)
        })
    }
    
    // MARK: Request Handler
    // Create request
    func createRequest(
        _ url: String,
        method: HTTPMethod,
        headers: [String: String]?,
        parameters: Parameters? = nil,
        onSuccess successCallback: ((JSON) -> Void)?,
        onFailure failureCallback: ((String) -> Void)?
        ) {
        
        Alamofire.request(url, method: method, parameters: parameters, encoding: JSONEncoding.default, headers: headers).validate(statusCode: 200..<300).responseJSON { response in
            
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                successCallback?(json)
            case .failure(let error):
                if let callback = failureCallback {
                    // Return
                    callback(error.localizedDescription)
                }
            }
        }
    }
}
