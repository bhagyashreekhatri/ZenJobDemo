//
//  ExploreJobService.swift
//  ZenjobDemo
//
//  Created by Bhagyashree Haresh Khatri on 03/09/2019.
//  Copyright © 2019 Bhagyashree Haresh Khatri. All rights reserved.
//

import Foundation

class ExploreJobService {
    
    public func callAPIGetOffers(offset:String,onSuccess successCallback: ((_ user: OffersModel) -> Void)?, onFailure failureCallback: ((_ errorMessage: String) -> Void)?) {
        APICallManager.instance.callAPIGetOffers(offset:offset,
                                                 onSuccess: { (user) in
                                                    successCallback?(user)
        },
                                                 onFailure: { (errorMessage) in
                                                    failureCallback?(errorMessage)
        }
        )
    }
}
