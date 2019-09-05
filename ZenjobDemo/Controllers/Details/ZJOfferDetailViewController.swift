//
//  ZJOfferDetailViewController.swift
//  ZenjobDemo
//
//  Created by Bhagyashree Haresh Khatri on 02/09/2019.
//  Copyright © 2019 Bhagyashree Haresh Khatri. All rights reserved.
//

import UIKit
import Foundation

class ZJOfferDetailViewController: UIViewController {

    
    @IBOutlet weak var shiftCollectionView: UICollectionView!
    @IBOutlet weak var totalEarningLabel: UILabel!
    @IBOutlet weak var hourlyEarningLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var jobCategoryLabel: UILabel!
    @IBOutlet weak var totalAmountLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var districtLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var gehaltTableViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var gehaltTableView: UITableView!

    var offerDetails  : OfferList?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        uiConfiguration()
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        gehaltTableViewHeightConstraint.constant = gehaltTableView.contentSize.height
    }
    
    //MARK: Set Up UI
    func uiConfiguration(){
        shiftCollectionView.delegate = self
        shiftCollectionView.dataSource = self
        gehaltTableView.delegate = self
        gehaltTableView.dataSource = self
        totalEarningLabel.text = String.emptyIfNil(offerDetails?.earningTotal) 
        hourlyEarningLabel.text = String.emptyIfNil(offerDetails?.earningHourly) + " pro Stunde"
        titleLabel.text = String.emptyIfNil(offerDetails?.title)
        jobCategoryLabel.text = String.emptyIfNil(offerDetails?.jobCategoryKey)
        totalAmountLabel.text = String.emptyIfNil(offerDetails?.earningTotal)
        locationLabel.text = String.emptyIfNil(offerDetails?.locationDict[0].locationName)
        districtLabel.text = String.emptyIfNil(offerDetails?.locationDict[0].district)
        addressLabel.text = String.emptyIfNil(offerDetails?.locationDict[0].locationName) + " , " + String.emptyIfNil(offerDetails?.locationDict[0].streetNumber) + " , " + String.emptyIfNil(offerDetails?.locationDict[0].street) + " , " + String.emptyIfNil(offerDetails?.locationDict[0].city) + " , " + String.emptyIfNil(offerDetails?.locationDict[0].district) + " , " + String.emptyIfNil(offerDetails?.locationDict[0].postalCode)
        
    }
    
    //MARK: IBActions
    @IBAction func closeAction(_ sender: UIButton) {
        self.dismiss(animated: false, completion:nil)
    }
    
}

//MARK: - UICollectionView Delegates & DataSource
extension ZJOfferDetailViewController: UICollectionViewDelegate,UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return offerDetails?.shiftsList.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // get a reference to our storyboard cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ZJOfferDetailCollectionViewCell", for: indexPath as IndexPath) as! ZJOfferDetailCollectionViewCell
        
        if let startdate = offerDetails?.shiftsList[indexPath.row].beginDate {
            cell.dayShiftLabel.text = ZJHelpers.getDayDateFormater(startdate,"E")
        }
        if let enddate = offerDetails?.shiftsList[indexPath.row].beginDate {
            cell.dateshiftLabel.text = ZJHelpers.getDayDateFormater(enddate,"dd.MM")
        }
        
        return cell
    }
}

//MARK: - UITableView Delegates & DataSource
extension ZJOfferDetailViewController: UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return offerDetails?.pricingTableList.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "ZJGehaltTableViewCell", for: indexPath) as! ZJGehaltTableViewCell
        
        cell.titleLabel.text = String(describing: Int.emptyIfNil(offerDetails?.pricingTableList[indexPath.row].minutes)) + " minutes " + String.emptyIfNil(offerDetails?.pricingTableList[indexPath.row].name)
        
        cell.amountLabel.text = String.emptyIfNil(offerDetails?.pricingTableList[indexPath.row].earningHourly)
            return cell
        
    }
}

