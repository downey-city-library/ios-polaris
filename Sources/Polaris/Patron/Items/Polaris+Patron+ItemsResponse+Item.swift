//
//  Polaris+Patron+ItemsResponse.swift
//  Polaris
//
//  Created by Andrew Despres on 5/13/20.
//  Copyright © 2020 Downey City Library. All rights reserved.
//

import Foundation

extension Polaris.Patron.ItemsResponse {

    public struct Item: Decodable {
        
        // MARK: - Properties
        public private(set) var ID: Int
        public private(set) var barcode: String
        public private(set) var bibID: Int
        public private(set) var formatID: Int
        public private(set) var formatDescription: String
        public private(set) var title: String
        public private(set) var author: String?
        public private(set) var callNumber: String
        public private(set) var checkoutDate: Date?
        public private(set) var dueDate: Date?
        public private(set) var renewalCount: Int
        public private(set) var renewalLimit: Int
        public private(set) var assignedBranchID: Int
        public private(set) var assignedBranchName: String
        public private(set) var loaningBranchID: Int
        public private(set) var loaningBranchName: String
        public private(set) var billingNoticeSent: Bool
        public private(set) var replacementChargeTransactionID: Int
        public private(set) var processingChargeTransactionID: Int
        public private(set) var overdueChargeTransactionID: Int
        public private(set) var displayInPAC: Bool
        public private(set) var electronicItem: Bool
        public private(set) var vendorName: String
        public private(set) var vendorAccountName: String
        public private(set) var vendorObjectIdentifier: Int
        public private(set) var ISBN: [String]?
        public private(set) var ISSN: String?
        public private(set) var OCLC: String?
        public private(set) var UPC: String?
        public private(set) var canItemBeRenewed: Bool
        public private(set) var designation: String?
        public private(set) var volumeNumber: String?
        
        // MARK: - Coding Keys
        private enum CodingKeys: String, CodingKey {
            
            case ID = "ItemID"
            case barcode = "Barcode"
            case bibID = "BibID"
            case formatID = "FormatID"
            case formatDescription = "FormatDescription"
            case title = "Title"
            case author = "Author"
            case callNumber = "CallNumber"
            case checkoutDate = "CheckOutDate"
            case dueDate = "DueDate"
            case renewalCount = "RenewalCount"
            case renewalLimit = "RenewalLimit"
            case assignedBranchID = "AssignedBranchID"
            case assignedBranchName = "AssignedBranchName"
            case loaningBranchID = "LoaningBranchID"
            case loaningBranchName = "LoaningBranchName"
            case billingNoticeSent = "BillingNoticeSent"
            case replacementChargeTransactionID = "ReplacementChargeTxnID"
            case processingChargeTransactionID = "ProcessingChargeTxnID"
            case overdueChargeTransactionID = "OverdueChargeTxnID"
            case displayInPAC = "DisplayInPAC"
            case electronicItem = "ElectronicItem"
            case vendorName = "VendorName"
            case vendorAccountName = "VendorAccountName"
            case vendorObjectIdentifier = "VendorObjectIdentifier"
            case ISBN = "ISBN"
            case ISSN = "ISSN"
            case OCLC = "OCLCNumber"
            case UPC = "UPCNumber"
            case canItemBeRenewed = "CanItemBeRenewed"
            case designation = "Designation"
            case volumeNumber = "VolumeNumber"
        }
        
        // MARK: - Initialization
        public init(from decoder: Decoder) throws {
            
            let data = try decoder.container(keyedBy: CodingKeys.self)
            
            ID = try data.decode(Int.self, forKey: .ID)
            barcode = try data.decode(String.self, forKey: .barcode)
            bibID = try data.decode(Int.self, forKey: .bibID)
            formatID = try data.decode(Int.self, forKey: .formatID)
            formatDescription = try data.decode(String.self, forKey: .formatDescription)
            title = try data.decode(String.self, forKey: .title)
            author = try? data.decode(String.self, forKey: .author)
            callNumber = try data.decode(String.self, forKey: .callNumber)
            checkoutDate = try? data.decode(String.self, forKey: .checkoutDate).toDate()
            dueDate = try? data.decode(String.self, forKey: .dueDate).toDate()
            renewalCount = try data.decode(Int.self, forKey: .renewalCount)
            renewalLimit = try data.decode(Int.self, forKey: .renewalLimit)
            assignedBranchID = try data.decode(Int.self, forKey: .assignedBranchID)
            assignedBranchName = try data.decode(String.self, forKey: .assignedBranchName)
            loaningBranchID = try data.decode(Int.self, forKey: .loaningBranchID)
            loaningBranchName = try data.decode(String.self, forKey: .loaningBranchName)
            billingNoticeSent = try data.decode(Bool.self, forKey: .billingNoticeSent)
            replacementChargeTransactionID = try data.decode(Int.self, forKey: .replacementChargeTransactionID)
            processingChargeTransactionID = try data.decode(Int.self, forKey: .processingChargeTransactionID)
            overdueChargeTransactionID = try data.decode(Int.self, forKey: .overdueChargeTransactionID)
            displayInPAC = try data.decode(Bool.self, forKey: .displayInPAC)
            electronicItem = try data.decode(Bool.self, forKey: .electronicItem)
            vendorName = try data.decode(String.self, forKey: .vendorName)
            vendorAccountName = try data.decode(String.self, forKey: .vendorAccountName)
            vendorObjectIdentifier = try data.decode(Int.self, forKey: .vendorObjectIdentifier)
            ISBN = try? data.decode([String].self, forKey: .ISBN)
            ISSN = try? data.decode(String.self, forKey: .ISSN)
            OCLC = try? data.decode(String.self, forKey: .OCLC)
            UPC = try? data.decode(String.self, forKey: .UPC)
            canItemBeRenewed = try data.decode(Bool.self, forKey: .canItemBeRenewed)
            designation = try? data.decode(String.self, forKey: .designation)
            volumeNumber = try? data.decode(String.self, forKey: .volumeNumber)
        }
    }
}
