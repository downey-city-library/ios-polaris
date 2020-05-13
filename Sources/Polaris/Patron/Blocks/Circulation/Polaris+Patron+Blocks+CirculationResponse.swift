//
//  Polaris+Patron+Blocks+CirculationResponse.swift
//  Polaris
//
//  Created by Andrew Despres on 4/13/20.
//  Copyright © 2020 Downey City Library. All rights reserved.
//

import Foundation

extension Polaris.Patron.Blocks {
    
    public struct CirculationResponse: Decodable {
        
        // MARK: - Properties
        public private(set) var error: PolarisError?
        public private(set) var assignedBranchId: Int
        public private(set) var assignedBranchName: String
        public private(set) var barcode: String
        public private(set) var blocks: [Block]
        public private(set) var canCirculate: Bool
        public private(set) var emailAddress: String?
        public private(set) var expirationDate: Date?
        public private(set) var isValid: Bool
        public private(set) var name: Name
        public private(set) var overridePasswordUsed: Bool
        public private(set) var patronBarcode: String
        public private(set) var patronCode: Int
        public private(set) var patronId: Int
        
        // MARK: - Coding Keys
        private enum CodingKeys: String, CodingKey {
            
            case errorCode = "PAPIErrorCode"
            case assignedBranchId = "AssignedBranchID"
            case assignedBranchName = "AssignedBranchName"
            case barcode = "Barcode"
            case blocks = "Blocks"
            case canCirculate = "CanPatronCirculate"
            case emailAddress = "EmailAddress"
            case expirationDate = "ExpirationDate"
            case isValid = "ValidPatron"
            case overridePasswordUsed = "OverridePasswordUsed"
            case patronBarcode = "PatronBarcode"
            case patronCode = "PatronCodeID"
            case patronId = "PatronID"
        }
        
        // MARK: - Initialization
        public init(from decoder: Decoder) throws {
            
            let data = try decoder.container(keyedBy: CodingKeys.self)
            let errorCode = try data.decode(Int.self, forKey: .errorCode)
            
            error = errorCode == 0 ? nil : PolarisError(rawValue: errorCode)
            
            assignedBranchId = try data.decode(Int.self, forKey: .assignedBranchId)
            assignedBranchName = try data.decode(String.self, forKey: .assignedBranchName)
            barcode = try data.decode(String.self, forKey: .barcode)
            blocks = (try? data.decode([Block].self, forKey: .blocks)) ?? []
            canCirculate = try data.decode(Bool.self, forKey: .canCirculate)
            emailAddress = try? data.decode(String.self, forKey: .emailAddress)
            expirationDate = try data.decode(String.self, forKey: .expirationDate).toDate()
            isValid = try data.decode(Bool.self, forKey: .isValid)
            name = try Name(from: decoder)
            overridePasswordUsed = try data.decode(Bool.self, forKey: .overridePasswordUsed)
            patronBarcode = try data.decode(String.self, forKey: .patronBarcode)
            patronCode = try data.decode(Int.self, forKey: .patronCode)
            patronId = try data.decode(Int.self, forKey: .patronId)
        }
    }
}
