//
//  ZJUserDefaults.swift
//  ZenjobDemo
//
//  Created by Bhagyashree Haresh Khatri on 03/09/2019.
//  Copyright © 2019 Bhagyashree Haresh Khatri. All rights reserved.
//

import UIKit
import Foundation

class ZJUserDefaults: NSObject {
    
    struct UserDefaultsKeys {
        fileprivate static let accessToken = "accessToken"
        
    }
    
    fileprivate static var userDefaults: Foundation.UserDefaults {
        get {
            Foundation.UserDefaults.standard.synchronize()
            return Foundation.UserDefaults.standard
        }
    }
    
    static var accessToken: String? {
        get {
            return userDefaults.string(forKey: UserDefaultsKeys.accessToken)
        }
        set (value) {
            userDefaults.setValue(value, forKey: UserDefaultsKeys.accessToken)
            userDefaults.synchronize()
        }
    }
    
    static func clear() {
        accessToken = ""
    }
}
