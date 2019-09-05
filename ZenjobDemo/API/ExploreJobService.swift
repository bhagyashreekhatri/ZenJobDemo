//
//  ExploreJobService.swift
//  ZenjobDemo
//
//  Created by Bhagyashree Haresh Khatri on 03/09/2019.
//  Copyright © 2019 Bhagyashree Haresh Khatri. All rights reserved.
//

import Foundation

class ExploreJobService {
    
    //MARK OFFERS LIST SERVICE
    public func callAPIGetOffers(offset:String,onSuccess successCallback: ((_ offers: OffersModel) -> Void)?, onFailure failureCallback: ((_ errorMessage: String) -> Void)?) {
        APICallManager.instance.callAPIGetOffers(offset:offset,
                                                 onSuccess: { (offers) in
                                                    successCallback?(offers)
        },
                                                 onFailure: { (errorMessage) in
                                                    failureCallback?(errorMessage)
        })
    }
    
    //MARK OFFER DETAILS SERVICE
    public func callAPIGetOfferDetails(id:String,onSuccess successCallback: ((_ offer: OfferList) -> Void)?, onFailure failureCallback: ((_ errorMessage: String) -> Void)?) {
        APICallManager.instance.callAPIGetOfferDetails(id:id,
                                                 onSuccess: { (offer) in
                                                    successCallback?(offer)
        },
                                                 onFailure: { (errorMessage) in
                                                    failureCallback?(errorMessage)
        })
    }
}
