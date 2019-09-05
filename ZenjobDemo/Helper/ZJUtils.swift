//
//  ZJUtils.swift
//  ZenjobDemo
//
//  Created by Bhagyashree Haresh Khatri on 05/09/2019.
//  Copyright © 2019 Bhagyashree Haresh Khatri. All rights reserved.
//

import Foundation

extension String {
    static func emptyIfNil(_ optionalString: String?) -> String {
        let text: String
        if let unwrapped = optionalString {
            text = unwrapped
        } else {
            text = "No Data Available"
        }
        return text
    }
}

extension Int {
    static func emptyIfNil(_ optionalInt: Int?) -> Int {
        let int: Int
        if let unwrapped = optionalInt {
            int = unwrapped
        } else {
            int = 0
        }
        return int
    }
}
