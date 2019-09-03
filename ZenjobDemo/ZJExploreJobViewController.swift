//
//  ZJExploreJobViewController.swift
//  ZenjobDemo
//
//  Created by Bhagyashree Haresh Khatri on 02/09/2019.
//  Copyright © 2019 Bhagyashree Haresh Khatri. All rights reserved.
//

import UIKit

class ZJExploreJobViewController: UIViewController {

    
    @IBOutlet weak var offersTableView: UITableView!
    let presenter = ExploreJobPresenter(exploreJobService: ExploreJobService())
    
    override func viewDidLoad() {
        super.viewDidLoad()

       uiConfiguration()
    }

    func uiConfiguration(){
        offersTableView.delegate = self
        offersTableView.dataSource = self
        presenter.attachView(view: self)
        presenter.getOffersListAPI(offset: "0")
    }
}

//MARK: - Protocols Implementation
extension ZJExploreJobViewController: ExploreJobView {
    
    func offersListSuccess(users: OffersModel){
//        if let token = users.access_token{
//            ZJUserDefaults.accessToken = token
//            performSegue(withIdentifier: Helpers.ZJDashboardSegue, sender: self)
//        }
    }
    
    func startLoading() {
        // Show your loader
       // activityIndicator?.startAnimating()
    }
    
    func finishLoading() {
        // Dismiss your loader
       // activityIndicator?.stopAnimating()
    }
    
    func showError(errorMessage: String){
        Helpers.showToast(controller: self, message: errorMessage)
    }
}


//MARK: - UITableView Delegates & DataSoruce
extension ZJExploreJobViewController: UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ZJExploreJobTableViewCell", for: indexPath) as! ZJExploreJobTableViewCell
        
        cell.containerView.layer.cornerRadius = 8
        cell.containerView.layer.masksToBounds = true
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
    }
    
    // Set the spacing between sections
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }

    // Make the background color show through
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 253
    }
    
}
