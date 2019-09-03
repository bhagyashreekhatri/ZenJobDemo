//
//  Helpers.swift
//  ZenjobDemo
//
//  Created by Bhagyashree Haresh Khatri on 02/09/2019.
//  Copyright © 2019 Bhagyashree Haresh Khatri. All rights reserved.
//

import UIKit
import Foundation
import DCToastView

class Helpers: NSObject {
    
    static let ZJDashboardSegue = "ZJDashboardSegue"
    
    //MARK: - Alert
    
    class func showToast(controller: UIViewController, message: String) {
        // ToastPresenter.shared.show(in: controller.view, message: message)
        ToastPresenter.shared.show(in: controller.view, message: message, place: .up, backgroundColor: .black, textColor: .white, timeOut: 3, roundness: .low)
    }
    
}
