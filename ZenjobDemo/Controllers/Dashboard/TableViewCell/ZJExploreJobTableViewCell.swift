//
//  ZJExploreJobTableViewCell.swift
//  ZenjobDemo
//
//  Created by Bhagyashree Haresh Khatri on 02/09/2019.
//  Copyright © 2019 Bhagyashree Haresh Khatri. All rights reserved.
//

import UIKit

class ZJExploreJobTableViewCell: UITableViewCell {
    
   
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var earningTotalLabel: UILabel!
    @IBOutlet weak var earningHourlyLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var startDateLabel: UILabel!
    @IBOutlet weak var endDateLabel: UILabel!
    @IBOutlet weak var breakTypeLabel: UILabel!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var startTimeLabel: UILabel!
    @IBOutlet weak var gradientView: ZJGradientView!
    @IBOutlet weak var districtLabel: UILabel!
    @IBOutlet weak var endTimeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        containerView.layer.cornerRadius = 8
        containerView.layer.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func customize(offerList: OfferList?) {
    
        guard let offerList = offerList else {
            return
        }
        
        titleLabel.text = String.emptyIfNil(offerList.title)
        earningTotalLabel.text = String.emptyIfNil(offerList.earningTotal)
        earningHourlyLabel.text = String.emptyIfNil(offerList.earningHourly) + " pro Stunde"
        locationLabel.text = String.emptyIfNil(offerList.locationDict[0].locationName)
        if let startdate = offerList.shiftsList[0].beginDate {
            startDateLabel.text = ZJHelpers.getDayDateFormater(startdate,"E.dd.MM")
        }
        if let enddate = offerList.shiftsList[0].endDate {
            endDateLabel.text = ZJHelpers.getDayDateFormater(enddate,"E.dd.MM")
        }
        breakTypeLabel.text = "+" + String(describing:offerList.shiftsList[0].breakTypes ?? 0) + " shifts"
        districtLabel.text = String.emptyIfNil(offerList.locationDict[0].district)
       
    }
}
