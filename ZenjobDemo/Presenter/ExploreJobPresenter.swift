//
//  ExploreJobPresenter.swift
//  ZenjobDemo
//
//  Created by Bhagyashree Haresh Khatri on 03/09/2019.
//  Copyright © 2019 Bhagyashree Haresh Khatri. All rights reserved.
//

import Foundation

protocol ExploreJobView: NSObjectProtocol {
    func startLoading()
    func finishLoading()
    func showError(errorMessage: String)
    func offersListSuccess(users: OffersModel)
}

class ExploreJobPresenter {
    private let exploreJobService:ExploreJobService
    weak private var exploreJobView : ExploreJobView?
    
    init(exploreJobService:ExploreJobService) {
        self.exploreJobService = exploreJobService
    }
    
    func attachView(view:ExploreJobView) {
        exploreJobView = view
    }
    
    func detachView() {
        exploreJobView = nil
    }
    
    func getOffersListAPI(offset:String) {
        self.exploreJobView?.startLoading()
        exploreJobService.callAPIGetOffers(offset:offset,
                                      onSuccess: { (user) in
                                        DispatchQueue.main.async {
                                            self.exploreJobView?.finishLoading()
                                            self.exploreJobView?.offersListSuccess(users: user)
                                        }
        },
                                      onFailure: { (errorMessage) in
                                        DispatchQueue.main.async {
                                            self.exploreJobView?.finishLoading()
                                            self.exploreJobView?.showError(errorMessage: errorMessage)
                                        }
        }
        )
    }
}
