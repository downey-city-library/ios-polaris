//
//  Polaris+Patron+HoldsResponse+HoldRequest.swift
//  Polaris
//
//  Created by Andrew Despres on 5/13/20.
//  Copyright © 2020 Downey City Library. All rights reserved.
//

import Foundation

extension Polaris.Patron.HoldsResponse {
    
    public struct HoldRequest: Decodable {
        
        // MARK: - Properties
        public private(set) var ID: Int
        public private(set) var bibID: Int
        public private(set) var consituentBibID: Int?
        public private(set) var statusID: Int
        public private(set) var statusDescription: String
        public private(set) var title: String
        public private(set) var author: String?
        public private(set) var callNumber: String
        public private(set) var formatID: Int
        public private(set) var formatDescription: String
        public private(set) var pickupBranchID: Int
        public private(set) var pickupBranchName: String
        public private(set) var pickupByDate: Date?
        public private(set) var queuePosition: Int
        public private(set) var queueTotal: Int
        public private(set) var activationDate: Date?
        public private(set) var expirationDate: Date?
        public private(set) var groupName: String?
        public private(set) var itemLevelHold: Bool
        public private(set) var borrowByMail: Bool
        public private(set) var hasConstituentBib: Bool
        public private(set) var newPickupBranchID: Int?
        public private(set) var newPickupBranch: String?
        public private(set) var innReachType: Int
        public private(set) var designation: String?
        public private(set) var volumeNumber: String?
        public private(set) var PACDisplayNotes: String
        public private(set) var canSuspend: Bool
        
        // MARK: - Coding Keys
        private enum CodingKeys: String, CodingKey {
            
            case ID = "HoldRequestID"
            case bibID = "BibID"
            case constituentBibID = "ConstituentBibID"
            case statusID = "StatusID"
            case statusDescription = "StatusDescription"
            case title = "Title"
            case author = "Author"
            case callNumber = "CallNumber"
            case formatID = "FormatID"
            case formatDescription = "FormatDescription"
            case pickupBranchID = "PickupBranchID"
            case pickupBranchName = "PickupBranchName"
            case pickupByDate = "PickupByDate"
            case queuePosition = "QueuePosition"
            case queueTotal = "QueueTotal"
            case activationDate = "ActivationDate"
            case expirationDate = "ExpirationDate"
            case groupName = "GroupName"
            case itemLevelHold = "ItemLevelHold"
            case borrowByMail = "BorrowByMail"
            case hasConstituentBib = "HasConstituentBib"
            case newPickupBranchID = "NewPickupBranchID"
            case newPickupBranch = "NewPickupBranch"
            case innReachType = "InnReachType"
            case designation = "Designation"
            case volumeNumber = "VolumeNumber"
            case PACDisplayNotes = "PACDisplayNotes"
            case canSuspend = "CanSuspend"
        }
        
        // MARK: - Initialization
        public init(from decoder: Decoder) throws {
            
            let data = try decoder.container(keyedBy: CodingKeys.self)
            
            ID = try data.decode(Int.self, forKey: .ID)
            bibID = try data.decode(Int.self, forKey: .bibID)
            consituentBibID = try? data.decode(Int.self, forKey: .constituentBibID)
            statusID = try data.decode(Int.self, forKey: .statusID)
            statusDescription = try data.decode(String.self, forKey: .statusDescription)
            title = try data.decode(String.self, forKey: .title)
            author = try? data.decode(String.self, forKey: .author)
            callNumber = try data.decode(String.self, forKey: .callNumber)
            formatID = try data.decode(Int.self, forKey: .formatID)
            formatDescription = try data.decode(String.self, forKey: .formatDescription)
            pickupBranchID = try data.decode(Int.self, forKey: .pickupBranchID)
            pickupBranchName = try data.decode(String.self, forKey: .pickupBranchName)
            pickupByDate = try? data.decode(String.self, forKey: .pickupByDate).toDate()
            queuePosition = try data.decode(Int.self, forKey: .queuePosition)
            queueTotal = try data.decode(Int.self, forKey: .queueTotal)
            activationDate = try? data.decode(String.self, forKey: .activationDate).toDate()
            expirationDate = try? data.decode(String.self, forKey: .expirationDate).toDate()
            groupName = try? data.decode(String.self, forKey: .groupName)
            itemLevelHold = try data.decode(Bool.self, forKey: .itemLevelHold)
            borrowByMail = try data.decode(Bool.self, forKey: .borrowByMail)
            hasConstituentBib = try data.decode(Bool.self, forKey: .hasConstituentBib)
            newPickupBranchID = try? data.decode(Int.self, forKey: .newPickupBranchID)
            newPickupBranch = try? data.decode(String.self, forKey: .newPickupBranch)
            innReachType = try data.decode(Int.self, forKey: .innReachType)
            designation = try? data.decode(String.self, forKey: .designation)
            volumeNumber = try? data.decode(String.self, forKey: .volumeNumber)
            PACDisplayNotes = try data.decode(String.self, forKey: .PACDisplayNotes)
            canSuspend = try data.decode(Bool.self, forKey: .canSuspend)
        }
    }
}
