//
//  Polaris+HoldRequest+CreateResponse.swift
//  Polaris
//
//  Created by Andrew Despres on 5/1/20.
//  Copyright © 2020 Downey City Library. All rights reserved.
//

import Foundation

extension Polaris.HoldRequest {
    
    public struct GetListResponse: Decodable {
        
        // MARK: - Properties
        public private(set) var error: PolarisError?
        public private(set) var createTime: Date?
        public private(set) var expirationTime: Date?
        public private(set) var list: [Row] = []
        public private(set) var recordCount: Int
        
        // MARK: - Coding Keys
        private enum CodingKeys: String, CodingKey {
            
            case errorCode = "PAPIErrorCode"
            case createTime = "PickListCreateTime"
            case expirationTime = "PickListExpirationTime"
            case list = "RequestPicklistRows"
            case recordCount = "RecordCount"
        }
        
        // MARK: - Initialization
        public init(from decoder: Decoder) throws {
            
            let data = try decoder.container(keyedBy: CodingKeys.self)
            let errorCode = try data.decode(Int.self, forKey: .errorCode)
            
            error = errorCode == 0 ? nil : PolarisError(rawValue: errorCode)
            
            createTime = try? (data.decode(String.self, forKey: .createTime)).toDate()
            expirationTime = try? (data.decode(String.self, forKey: .expirationTime)).toDate()
            list = try data.decode([Row].self, forKey: .list)
            recordCount = try data.decode(Int.self, forKey: .recordCount)
        }
    }
}

extension Polaris.HoldRequest.GetListResponse {
    
    public struct Row: Decodable {
        
        // MARK: - Properties
        public private(set) var requestID: Int
        public private(set) var statusID: Int
        public private(set) var status: String
        public private(set) var pickupBranchID: Int
        public private(set) var pickupBranch: String
        public private(set) var activationDate: Date?
        public private(set) var expirationDate: Date?
        public private(set) var statusDate: Date?
        public private(set) var bibID: Int
        public private(set) var constituentBibID: Int
        public private(set) var browseAuthor: String?
        public private(set) var browseTitle: String
        public private(set) var tomID: Int
        public private(set) var tom: String
        public private(set) var isItemLevelHold: Bool
        public private(set) var isBorrowByMail: Bool
        public private(set) var patronID: Int
        public private(set) var patronBarcode: String
        public private(set) var patronBranchID: Int
        public private(set) var patronBranch: String
        public private(set) var patronFullName: String
        public private(set) var patronCodeID: Int
        public private(set) var patronCode: String
        public private(set) var emailAddress: String?
        public private(set) var altEmailAddress: String?
        public private(set) var phoneVoice1: String?
        public private(set) var smsAddress: String?
        public private(set) var itemRecordID: Int
        public private(set) var itemBarcode: String?
        public private(set) var itemBranchID: Int
        public private(set) var itemBranch: String?
        public private(set) var callNumber: String?
        public private(set) var copyNumber: String?
        public private(set) var volumeNumber: String?
        public private(set) var pages: String?
        public private(set) var assignedCollectionID: Int
        public private(set) var collectionName: String?
        public private(set) var materialTypeID: Int
        public private(set) var materialType: String?
        public private(set) var shelfLocationID: Int
        public private(set) var shelfLocation: String?
        public private(set) var publicationYear: Int
        public private(set) var publisher: String?
        public private(set) var designation: String?
        public private(set) var edition: String?
        public private(set) var staffDisplayNotes: String?
        public private(set) var nonPublicNotes: String?
        public private(set) var PACDisplayNotes: String?
        public private(set) var sortTitle: String?
        public private(set) var sortAuthor: String?
        
        // MARK: - Coding Keys
        private enum CodingKeys: String, CodingKey {
            case requestID = "SysHoldRequestID"
            case statusID = "SysHoldStatusID"
            case status = "HoldStatus"
            case pickupBranchID = "PickupBranchID"
            case pickupBranch = "PickupBranch"
            case activationDate = "ActivationDate"
            case expirationDate = "ExpirationDate"
            case statusDate = "StatusDate"
            case bibID = "BibliographicRecordID"
            case constituentBibID = "ConstituentBibRecordID"
            case browseAuthor = "BrowseAuthor"
            case browseTitle = "BrowseTitle"
            case tomID = "PrimaryMARCTOMID"
            case tom = "MarcTypeOfMaterial"
            case isItemLevelHold = "ItemLevelHold"
            case isBorrowByMail = "BorrowByMail"
            case patronID = "PatronID"
            case patronBarcode = "PatronBarcode"
            case patronBranchID = "PatronBranchID"
            case patronBranch = "PatronBranch"
            case patronFullName = "PatronFullName"
            case patronCodeID = "PatronCodeID"
            case patronCode = "PatronCode"
            case emailAddress = "EmailAddress"
            case altEmailAddress = "AltEmailAddress"
            case phoneVoice1 = "PhoneVoice1"
            case smsAddress = "SMSAddress"
            case itemRecordID = "ItemRecordID"
            case itemBarcode = "ItemBarcode"
            case itemBranchID = "ItemBranchID"
            case itemBranch = "ItemBranch"
            case callNumber = "CallNumber"
            case copyNumber = "CopyNumber"
            case volumeNumber = "VolumeNumber"
            case pages = "Pages"
            case assignedCollectionID = "AssignedCollectionID"
            case collectionName = "CollectionName"
            case materialTypeID = "MaterialTypeID"
            case materialType = "MaterialType"
            case shelfLocationID = "ShelfLocationID"
            case shelfLocation = "ShelfLocation"
            case publicationYear = "PublicationYear"
            case publisher = "Publisher"
            case designation = "Designation"
            case edition = "Edition"
            case staffDisplayNotes = "StaffDisplayNotes"
            case nonPublicNotes = "NonPublicNotes"
            case PACDisplayNotes = "PACDisplayNotes"
            case sortTitle = "SortTitle"
            case sortAuthor = "SortAuthor"
        }
        
        // MARK: - Initialization
        public init(from decoder: Decoder) throws {
            
            let data = try decoder.container(keyedBy: CodingKeys.self)
            
            requestID = try data.decode(Int.self, forKey: .requestID)
            statusID = try data.decode(Int.self, forKey: .statusID)
            status = try data.decode(String.self, forKey: .status)
            pickupBranchID = try data.decode(Int.self, forKey: .pickupBranchID)
            pickupBranch = try data.decode(String.self, forKey: .pickupBranch)
            activationDate = try? (data.decode(String.self, forKey: .activationDate)).toDate()
            expirationDate = try? (data.decode(String.self, forKey: .expirationDate)).toDate()
            statusDate = try? (data.decode(String.self, forKey: .statusDate)).toDate()
            bibID = try data.decode(Int.self, forKey: .bibID)
            constituentBibID = try data.decode(Int.self, forKey: .constituentBibID)
            browseAuthor = try? data.decode(String.self, forKey: .browseAuthor)
            browseTitle = try data.decode(String.self, forKey: .browseTitle)
            tomID = try data.decode(Int.self, forKey: .tomID)
            tom = try data.decode(String.self, forKey: .tom)
            isItemLevelHold = try data.decode(Bool.self, forKey: .isItemLevelHold)
            isBorrowByMail = try data.decode(Bool.self, forKey: .isBorrowByMail)
            patronID = try data.decode(Int.self, forKey: .patronID)
            patronBarcode = try data.decode(String.self, forKey: .patronBarcode)
            patronBranchID = try data.decode(Int.self, forKey: .patronBranchID)
            patronBranch = try data.decode(String.self, forKey: .patronBranch)
            patronFullName = try data.decode(String.self, forKey: .patronFullName)
            patronCodeID = try data.decode(Int.self, forKey: .patronCodeID)
            patronCode = try data.decode(String.self, forKey: .patronCode)
            emailAddress = try? data.decode(String.self, forKey: .emailAddress)
            altEmailAddress = try? data.decode(String.self, forKey: .altEmailAddress)
            phoneVoice1 = try? data.decode(String.self, forKey: .phoneVoice1)
            smsAddress = try? data.decode(String.self, forKey: .smsAddress)
            itemRecordID = try data.decode(Int.self, forKey: .itemRecordID)
            itemBarcode = try? data.decode(String.self, forKey: .itemBarcode)
            itemBranchID = try data.decode(Int.self, forKey: .itemBranchID)
            itemBranch = try? data.decode(String.self, forKey: .itemBranch)
            callNumber = try? data.decode(String.self, forKey: .callNumber)
            copyNumber = try? data.decode(String.self, forKey: .copyNumber)
            volumeNumber = try? data.decode(String.self, forKey: .volumeNumber)
            pages = try? data.decode(String.self, forKey: .pages)
            assignedCollectionID = try data.decode(Int.self, forKey: .assignedCollectionID)
            collectionName = try? data.decode(String.self, forKey: .collectionName)
            materialTypeID = try data.decode(Int.self, forKey: .materialTypeID)
            materialType = try? data.decode(String.self, forKey: .materialType)
            shelfLocationID = try data.decode(Int.self, forKey: .shelfLocationID)
            shelfLocation = try? data.decode(String.self, forKey: .shelfLocation)
            publicationYear = try data.decode(Int.self, forKey: .publicationYear)
            publisher = try? data.decode(String.self, forKey: .publisher)
            designation = try? data.decode(String.self, forKey: .designation)
            edition = try? data.decode(String.self, forKey: .edition)
            staffDisplayNotes = try? data.decode(String.self, forKey: .staffDisplayNotes)
            nonPublicNotes = try? data.decode(String.self, forKey: .nonPublicNotes)
            PACDisplayNotes = try? data.decode(String.self, forKey: .PACDisplayNotes)
            sortTitle = try? data.decode(String.self, forKey: .sortTitle)
            sortAuthor = try? data.decode(String.self, forKey: .sortAuthor)
        }
    }
}
