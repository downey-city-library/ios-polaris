//
//  Polaris+Patron+Registration+CreateResponse.swift
//  Polaris
//
//  Created by Andrew Despres on 3/29/19.
//  Copyright © 2020 Downey City Library. All rights reserved.
//

import Foundation

extension Polaris.Patron.Registration {
    
    public struct CreateResponse: Decodable {
        
        // MARK: - Properties
        public private(set) var barcode: String?
        public private(set) var patronId: Int?
        
        // MARK: - Coding Keys
        private enum CodingKeys: String, CodingKey {
            
            case barcode = "Barcode"
            case patronId = "PatronID"
        }
        
        // MARK: - Initialization
        public init(from decoder: Decoder) throws {
            
            let data = try decoder.container(keyedBy: CodingKeys.self)
            
            barcode = try? data.decode(String.self, forKey: .barcode)
            patronId = try? data.decode(Int.self, forKey: .patronId)
        }
    }
}
