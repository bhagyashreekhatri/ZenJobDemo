//
//  ZJOfferDetailViewController.swift
//  ZenjobDemo
//
//  Created by Bhagyashree Haresh Khatri on 02/09/2019.
//  Copyright © 2019 Bhagyashree Haresh Khatri. All rights reserved.
//

import UIKit

class ZJOfferDetailViewController: UIViewController {

    
    @IBOutlet weak var shiftCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        uiConfiguration()
    }
    
    func uiConfiguration(){
        shiftCollectionView.delegate = self
        shiftCollectionView.dataSource = self
    }
}

//MARK: - UITableView Delegates & DataSoruce
extension ZJOfferDetailViewController: UICollectionViewDelegate,UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // get a reference to our storyboard cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ZJOfferDetailCollectionViewCell", for: indexPath as IndexPath) as! ZJOfferDetailCollectionViewCell
        
        // Use the outlet in our custom class to get a reference to the UILabel in the cell
        cell.layer.cornerRadius = 8
        cell.layer.masksToBounds = true
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.layer.borderWidth = 1
        // make cell more visible in our example project
        
        return cell
    }
    
    
}
