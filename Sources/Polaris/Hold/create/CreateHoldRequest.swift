//
//  CreateHoldRequest.swift
//  Polaris
//
//  Created by Andrew Despres on 4/26/20.
//  Copyright © 2020 Downey City Library. All rights reserved.
//

import Foundation

public struct CreateHoldRequest: Encodable {
    
    // MARK: - Required Properties
    public private(set) var bibID: Int
    public private(set) var patronID: Int
    public private(set) var pickupOrganizationID: Int
    public private(set) var requestingOrganizationID: Int
    public private(set) var userID: Int
    public private(set) var workstationID: Int
    
    // MARK: - Optional Properties
    public private(set) var activationDate: String?
    public private(set) var designation: Bool?
    public private(set) var isBorrowByMail: Bool?
    public private(set) var itemBarcode: String?
    public private(set) var patronNotes: String?
    public private(set) var targetGUID: Int?
    public private(set) var volumeNumber: Int?
        
    // MARK: - Coding Keys
    private enum CodingKeys: String, CodingKey {
        
        case patronID = "PatronID"
        case bibID = "BibID"
        case itemBarcode = "ItemBarcode"
        case volumeNumber = "VolumeNumber"
        case designation = "Designation"
        case pickupOrganizationID = "PickupOrgID"
        case isBorrowByMail = "IsBorrowByMail"
        case patronNotes = "PatronNotes"
        case activationDate = "ActivationDate"
        case workstationID = "WorkstationID"
        case userID = "UserID"
        case requestingOrganizationID = "RequestingOrgID"
        case targetGUID = "TargetGUID"
    }
    
    // MARK: - Initialization
    public init(bibID: Int,
                patronID: Int,
                pickupOrganizationID: Int = 0,
                requestingOrganizationID: Int,
                userID: Int,
                workstationID: Int,
                activationDate: String? = nil,
                designation: Bool? = nil,
                isBorrowByMail: Bool? = nil,
                itemBarcode: String? = nil,
                patronNotes: String? = nil,
                targetGUID: Int? = nil,
                volumeNumber: Int? = nil) {
        
        self.bibID = bibID
        self.patronID = patronID
        self.pickupOrganizationID = pickupOrganizationID
        self.requestingOrganizationID = requestingOrganizationID
        self.userID = userID
        self.workstationID = workstationID
        
        self.activationDate = activationDate
        self.designation = designation
        self.isBorrowByMail = isBorrowByMail
        self.itemBarcode = itemBarcode
        self.patronNotes = patronNotes
        self.targetGUID = targetGUID
        self.volumeNumber = volumeNumber
    }
}
