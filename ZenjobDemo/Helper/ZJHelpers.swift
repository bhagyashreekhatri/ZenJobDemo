//
//  ZJHelpers.swift
//  ZenjobDemo
//
//  Created by Bhagyashree Haresh Khatri on 02/09/2019.
//  Copyright © 2019 Bhagyashree Haresh Khatri. All rights reserved.
//

import UIKit
import Foundation
import DCToastView

class ZJHelpers: NSObject {
    
    static let ZJDashboardSegue = "ZJDashboardSegue"
    static let ZJOfferDetailsSegue = "ZJOfferDetailsSegue"
    static let orangeEndColor = UIColor(red:254.0/255.0, green:122.0/255.0, blue:47.0/255.0, alpha:1.0)
    static let orangeStartColor = UIColor(red:252.0/255.0, green:94.0/255.0, blue:119.0/255.0, alpha:1.0)
    static let  purpleStartColor = UIColor(red:117.0/255.0, green:35.0/255.0, blue:159.0/255.0, alpha:1.0)
    static let  purpleEndColor = UIColor(red:210.0/255.0, green:53.0/255.0, blue:220.0/255.0, alpha:1.0)
    static let  blueStartColor = UIColor(red:6.0/255.0, green:13.0/255.0, blue:193.0/255.0, alpha:1.0)
    static let  blueEndColor = UIColor(red:30.0/255.0, green:151.0/255.0, blue:228.0/255.0, alpha:1.0)
    static let  viewMapsColor = UIColor(red:71.0/255.0, green:28.0/255.0, blue:149.0/255.0, alpha:1.0)
    
    //MARK: - Date Format Conversion
    
    static func getDayDateFormater(_ date: String, _ inFormat: String) -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let date = dateFormatter.date(from: date)
        dateFormatter.dateFormat = inFormat
        return  dateFormatter.string(from: date ?? Date.init())
    }
    
    //MARK: - Alert
    
    static func showToast(controller: UIViewController, message: String) {
        // ToastPresenter.shared.show(in: controller.view, message: message)
        ToastPresenter.shared.show(in: controller.view, message: message, place: .up, backgroundColor: .black, textColor: .white, timeOut: 3, roundness: .low)
    }
    
}
