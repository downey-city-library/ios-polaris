//
//  Polaris+Patron+SearchResponse+Result.swift
//  Polaris
//
//  Created by Andrew Despres on 4/11/20.
//  Copyright © 2020 Downey City Library. All rights reserved.
//

import Foundation

extension Polaris.Patron.SearchResponse {
    
    public struct Result: Decodable {
        
        // MARK: - Properties
        public private(set) var barcode: String
        public private(set) var fullName: String
        public private(set) var id: Int
        public private(set) var organizationId: Int
        
        // MARK: - Coding Keys
        private enum CodingKeys: String, CodingKey {
            
            case barcode = "Barcode"
            case fullName = "PatronFirstLastName"
            case id = "PatronID"
            case organizationId = "OrganizationID"
        }
        
        // MARK: - Initialization
        public init(from decoder: Decoder) throws {
            
            let data = try decoder.container(keyedBy: CodingKeys.self)
            
            barcode = try data.decode(String.self, forKey: .barcode)
            fullName = try data.decode(String.self, forKey: .fullName)
            id = try data.decode(Int.self, forKey: .id)
            organizationId = try data.decode(Int.self, forKey: .organizationId)
        }
    }
}
