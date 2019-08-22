//
//  ItemDecoder.swift
//  Polaris
//
//  Created by Andrew Despres on 8/5/19.
//  Copyright © 2019 Downey City Library. All rights reserved.
//

import Foundation

internal struct ItemDecoder {
    internal static func parseBilling(from data: KeyedDecodingContainer<Item.CodingKeys>) throws -> Item.Billing {
        let wasNoticeSent = try data.decode(Int.self, forKey: .billingNoticeSent) == 1 ? true : false
        let chargeTransactionID = try parseChargeTransaction(from: data)
        
        return Item.Billing(wasNoticeSent: wasNoticeSent, chargeTransactionID: chargeTransactionID)
    }
    
    internal static func parseChargeTransaction(from data: KeyedDecodingContainer<Item.CodingKeys>) throws -> Item.Billing.ChargeTransactionID {
        let overdue = try data.decode(Int.self, forKey: .overdueChargeID)
        let processing = try data.decode(Int.self, forKey: .processingChargeID)
        let replacement = try data.decode(Int.self, forKey: .replacementChargeID)
        
        return Item.Billing.ChargeTransactionID(overdue: overdue, processing: processing, replacement: replacement)
    }
    
    internal static func parseBib(from data: KeyedDecodingContainer<Item.CodingKeys>) throws -> Item.Bib {
        let ID = try? data.decode(Int.self, forKey: .bibID)
        let title = try data.decode(String.self, forKey: .title)
        let author = try? data.decode(String.self, forKey: .author)
        let ISBN = try? data.decode(String.self, forKey: .ISBN)
        let ISSN = try? data.decode(String.self, forKey: .ISSN)
        let OCLC = try? data.decode(String.self, forKey: .OCLC)
        let UPC = try? data.decode(String.self, forKey: .UPC)
        let volumeNumber = try? data.decode(String.self, forKey: .volumeNumber)
        
        return Item.Bib(ID: ID, title: title, author: author, ISBN: ISBN, ISSN: ISSN, OCLC: OCLC, UPC: UPC, volumeNumber: volumeNumber)
    }
    
    internal static func parseVendor(from data: KeyedDecodingContainer<Item.CodingKeys>) throws -> Item.Vendor {
        let ID = try? data.decode(Int.self, forKey: .vendorID)
        let accountName = try? data.decode(String.self, forKey: .vendorAccountName)
        let name = try? data.decode(String.self, forKey: .vendorName)
        
        return Item.Vendor(ID: ID, accountName: accountName, name: name)
    }
    
    internal static func parseFormat(from data: KeyedDecodingContainer<Item.CodingKeys>) throws -> Item.Format {
        let ID = try data.decode(Int.self, forKey: .formatID)
        let description = try data.decode(String.self, forKey: .formatDescription)
        
        return Item.Format(ID: ID, description: description)
    }
    
    internal static func parseRenewal(from data: KeyedDecodingContainer<Item.CodingKeys>) throws -> Item.Renewal {
        let count = try data.decode(String.self, forKey: .renewalCount).toInt()!
        let limit = try data.decode(String.self, forKey: .renewalLimit).toInt()!
        let isAvailable = try data.decode(Bool.self, forKey: .renewalIsAvailable)
        
        return Item.Renewal(count: count, limit: limit, isAvailable: isAvailable)
    }
    
    internal static func parseAssignedBranch(from data: KeyedDecodingContainer<Item.CodingKeys>) throws -> Item.Branch {
        let ID = try data.decode(Int.self, forKey: .assignedBranchID)
        let name = try data.decode(String.self, forKey: .assignedBranchName)
        
        return Item.Branch(ID: ID, name: name)
    }
    
    internal static func parseLoaningBranch(from data: KeyedDecodingContainer<Item.CodingKeys>) throws -> Item.Branch {
        let ID = try data.decode(Int.self, forKey: .loaningBranchID)
        let name = try data.decode(String.self, forKey: .loaningBranchName)
        
        return Item.Branch(ID: ID, name: name)
    }
    
    internal static func parseDate(from data: KeyedDecodingContainer<Item.CodingKeys>, forKey key: KeyedDecodingContainer<Item.CodingKeys>.Key) throws -> Date? {
        let dateString = try? data.decode(String.self, forKey: key)
        if let dateString = dateString {
            return dateString.toDate()
        }
        
        return nil
    }
}
