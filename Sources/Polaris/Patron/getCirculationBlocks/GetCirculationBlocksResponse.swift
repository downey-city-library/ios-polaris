//
//  GetCirculationBlocksResponse.swift
//  Polaris
//
//  Created by Andrew Despres on 4/13/20.
//  Copyright © 2020 Downey City Library. All rights reserved.
//

import Foundation

public struct GetCirculationBlocksResponse: Decodable {
    
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

extension GetCirculationBlocksResponse {
    
    public struct Block: Decodable {
        
        // MARK: - Properties
        public private(set) var description: String
        public private(set) var patronId: Int
        public private(set) var patronName: String
        
        // MARK: - Coding Keys
        private enum CodingKeys: String, CodingKey {
            case description = "BlockDescription"
            case patronId = "PatronID"
            case patronName = "PatronName"
        }
        
        // MARK: - Initialization
        public init(from decoder: Decoder) throws {
            let data = try decoder.container(keyedBy: CodingKeys.self)
            
            description = try data.decode(String.self, forKey: .description)
            patronId = try data.decode(Int.self, forKey: .patronId)
            patronName = try data.decode(String.self, forKey: .patronName)
        }
    }
}

extension GetCirculationBlocksResponse {
    
    public struct Name: Decodable {
        
        // MARK: - Properties
        public private(set) var first: String
        public private(set) var last: String
        public private(set) var middle: String?
        
        // MARK: - Coding Keys
        private enum CodingKeys: String, CodingKey {
            
            case first = "NameFirst"
            case last = "NameLast"
            case middle = "NameMiddle"
        }
        
        // MARK: - Initialization
        public init(from decoder: Decoder) throws {
            let data = try decoder.container(keyedBy: CodingKeys.self)
            
            first = try data.decode(String.self, forKey: .first)
            last = try data.decode(String.self, forKey: .last)
            middle = try? data.decode(String.self, forKey: .middle)
        }
    }
}
