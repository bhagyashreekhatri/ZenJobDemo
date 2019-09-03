//
//  OffersModel.swift
//  ZenjobDemo
//
//  Created by Bhagyashree Haresh Khatri on 03/09/2019.
//  Copyright © 2019 Bhagyashree Haresh Khatri. All rights reserved.
//

import Foundation

class OffersModel {
    var offset: Int?
    var max: Int?
    var total: Int?
    var newestTimestamp: Int?
    var offersList          : [OffersList] = []
    
    // MARK: Instance Method
    func loadFromDictionary(_ dict: [String: AnyObject]) {
        if let offset = dict["offset"] as? Int {
            self.offset = offset
        }
        if let max = dict["max"] as? Int {
            self.max = max
        }
        if let total = dict["total"] as? Int {
            self.total = total
        }
        if let newestTimestamp = dict["newestTimestamp"] as? Int {
            self.newestTimestamp = newestTimestamp
        }
        
        if let cardList = dict["offers"] as? NSArray {
            for cardItem in cardList {
                var voucherData: OffersList = OffersList()
                voucherData.loadOffersFromDictionary(cardItem as! [String : AnyObject])
                offersList.append(voucherData)
            }
        }
    }
    
    
    // MARK: Class Method
    class func build(_ dict: [String: AnyObject]) -> OffersModel {
        let user = OffersModel()
        user.loadFromDictionary(dict)
        return user
    }
    
}

struct OffersList {
    var id: String?
    var jobMatchUuid: String?
    var jobCategoryKey: String?
    var title: String?
    var description: String?
    var instructions: String?
    var companyName: String?
    var companyLogoUrl: String?
    var minutesSum: String?
    var hourSum: String?
    var earningTotal: String?
    var earningHourly: String?
    var breakTypeList          : [BreakType] = []
    var shiftsList             : [Shifts] = []
    var pricingTableList       : [PricingTables] = []
    var locationDict           : [Location] = [Location]()
    
    // MARK: Instance Method
    mutating func loadOffersFromDictionary(_ dict: [String: AnyObject]) {
        if let id = dict["id"] as? String {
            self.id = id
        }
        if let jobMatchUuid = dict["jobMatchUuid"] as? String {
            self.jobMatchUuid = jobMatchUuid
        }
        if let jobCategoryKey = dict["jobCategoryKey"] as? String {
            self.jobCategoryKey = jobCategoryKey
        }
        if let title = dict["title"] as? String {
            self.title = title
        }
        if let description = dict["description"] as? String {
            self.description = description
        }
        if let instructions = dict["instructions"] as? String {
            self.instructions = instructions
        }
        if let companyName = dict["companyName"] as? String {
            self.companyName = companyName
        }
        if let companyLogoUrl = dict["companyLogoUrl"] as? String {
            self.companyLogoUrl = companyLogoUrl
        }
        if let minutesSum = dict["minutesSum"] as? String {
            self.minutesSum = minutesSum
        }
        if let hourSum = dict["hourSum"] as? String {
            self.hourSum = hourSum
        }
        if let earningTotal = dict["earningTotal"] as? String {
            self.earningTotal = earningTotal
        }
        if let earningHourly = dict["earningHourly"] as? String {
            self.earningHourly = earningHourly
        }
        if let breakTypeList = dict["breakTypes"] as? NSArray {
            for cardItem in breakTypeList {
                var voucherData: BreakType = BreakType()
                voucherData.loadBreakTypeFromDictionary(cardItem as! [String : AnyObject])
                self.breakTypeList.append(voucherData)
            }
        }
        if let shiftsList = dict["shifts"] as? NSArray {
            for cardItem in shiftsList {
                var voucherData: Shifts = Shifts()
                voucherData.loadShiftsFromDictionary(cardItem as! [String : AnyObject])
                self.shiftsList.append(voucherData)
            }
        }
        if let pricingTablesList = dict["pricingTables"] as? NSArray {
            for cardItem in pricingTablesList {
                var voucherData: PricingTables = PricingTables()
                voucherData.loadPricingTableFromDictionary(cardItem as! [String : AnyObject])
                self.pricingTableList.append(voucherData)
            }
        }
        if let locationDict = dict["location"] as? Dictionary<String,Any> {
            if locationDict.count > 0 {
                var voucherData: Location = Location()
                self.locationDict = [voucherData.build(locationDict as [String : AnyObject])]
            }
        }
    }
}

struct BreakType {
    var minutes: Int?
    var description: String?
    
    
    // MARK: Instance Method
    mutating func loadBreakTypeFromDictionary(_ dict: [String: AnyObject]) {
        if let minutes = dict["minutes"] as? Int {
            self.minutes = minutes
        }
        if let description = dict["description"] as? String {
            self.description = description
        }
    }
}

struct Shifts {
    var beginDate: String?
    var endDate: String?
    var breakTypes: Int?
    
    
    // MARK: Instance Method
    mutating func loadShiftsFromDictionary(_ dict: [String: AnyObject]) {
        if let beginDate = dict["beginDate"] as? String {
            self.beginDate = beginDate
        }
        if let endDate = dict["endDate"] as? String {
            self.endDate = endDate
        }
        if let breakTypes = dict["breakTypes"] as? Int {
            self.breakTypes = breakTypes
        }
    }
}

struct PricingTables {
    var isSummary: Bool?
    var times: String?
    var minutes: Int?
    var name: String?
    var unpaid: Bool?
    var earningHourly: String?
    var earningTotal: String?
    
    
    // MARK: Instance Method
    mutating func loadPricingTableFromDictionary(_ dict: [String: AnyObject]) {
        if let isSummary = dict["isSummary"] as? Bool {
            self.isSummary = isSummary
        }
        if let times = dict["times"] as? String {
            self.times = times
        }
        if let minutes = dict["minutes"] as? Int {
            self.minutes = minutes
        }
        if let name = dict["name"] as? String {
            self.name = name
        }
        if let unpaid = dict["unpaid"] as? Bool {
            self.unpaid = unpaid
        }
        if let earningHourly = dict["earningHourly"] as? String {
            self.earningHourly = earningHourly
        }
        if let earningTotal = dict["earningTotal"] as? String {
            self.earningTotal = earningTotal
        }
    }
}

struct Location {
    var locationName: String?
    var locationDisplayName: String?
    var street: String?
    var streetNumber: String?
    var supplementary: String?
    var postalCode: String?
    var city: String?
    var district: String?
    var locationSearchString: String?
    var locationLongitude: Double?
    var locationLatitude: Double?
    
    
    // MARK: Instance Method
    mutating func loadLocationFromDictionary(_ dict: [String: AnyObject]) {
        if let locationName = dict["locationName"] as? String {
            self.locationName = locationName
        }
        if let locationDisplayName = dict["locationDisplayName"] as? String {
            self.locationDisplayName = locationDisplayName
        }
        if let street = dict["street"] as? String {
            self.street = street
        }
        if let streetNumber = dict["streetNumber"] as? String {
            self.streetNumber = streetNumber
        }
        if let supplementary = dict["supplementary"] as? String {
            self.supplementary = supplementary
        }
        if let postalCode = dict["postalCode"] as? String {
            self.postalCode = postalCode
        }
        if let city = dict["city"] as? String {
            self.city = city
        }
        if let district = dict["district"] as? String {
            self.district = district
        }
        if let locationSearchString = dict["locationSearchString"] as? String {
            self.locationSearchString = locationSearchString
        }
        if let locationLongitude = dict["locationLongitude"] as? Double {
            self.locationLongitude = locationLongitude
        }
        if let locationLatitude = dict["locationLatitude"] as? Double {
            self.locationLatitude = locationLatitude
        }
    }
    
    
    // MARK: Class Method
    mutating func build(_ dict: [String: AnyObject]) -> Location {
        var user = Location()
        user.loadLocationFromDictionary(dict)
        return user
    }
    
}
