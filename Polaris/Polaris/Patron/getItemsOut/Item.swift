//
//  Item.swift
//  Polaris
//
//  Created by Andrew Despres on 8/5/19.
//  Copyright © 2019 Downey City Library. All rights reserved.
//

import Foundation

public struct Item {
    
    // MARK: - Public Properties
    public let ID: Int?
    public let barcode: String
    public let format: Format?
    public let bib: Bib
    public let callNumber: String
    public let checkoutDate: Date?
    public let dueDate: Date?
    public let renewal: Renewal?
    public let assignedBranch: Branch?
    public let loaningBranch: Branch?
    public let billing: Billing?
    public let isVisibleInPAC: Bool?
    public let isElectronic: Bool?
    public let vendor: Vendor?
    public let designation: String?
    
    // MARK: - Coding Keys
    enum CodingKeys: String, CodingKey {
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
        case replacementChargeID = "ReplacementChargeTxnID"
        case processingChargeID = "ProcessingChargeTxnID"
        case overdueChargeID = "OverdueChargeTxnID"
        case isVisibleInPAC = "DisplayInPAC"
        case isElectronic = "ElectronicItem"
        case vendorName = "VendorName"
        case vendorAccountName = "VendorAccountName"
        case vendorID = "VendorObjectIdentifier"
        case ISBN = "ISBN"
        case ISSN = "ISSN"
        case OCLC = "OCLCNumber"
        case UPC = "UPCNumber"
        case designation = "Designation"
        case volumeNumber = "VolumeNumber"
        case renewalIsAvailable = "CanItemBeRenewed"
    }
    
    // MARK: - Initialization
    public init(barcode: String, title: String) {
        self.ID = nil
        self.barcode = barcode
        self.format = nil
        self.bib = Bib(ID: nil, title: title, author: nil, ISBN: nil, ISSN: nil, OCLC: nil, UPC: nil, volumeNumber: nil)
        self.callNumber = ""
        self.checkoutDate = nil
        self.dueDate = nil
        self.renewal = nil
        self.assignedBranch = nil
        self.loaningBranch = nil
        self.billing = nil
        self.isVisibleInPAC = nil
        self.isElectronic = nil
        self.vendor = nil
        self.designation = nil
    }
}
