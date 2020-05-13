//
//  Polaris+Patron+BasicDataResponse+BasicData+MessageCounts.swift
//  Polaris
//
//  Created by Andrew Despres on 5/12/20.
//  Copyright © 2020 Downey City Library. All rights reserved.
//

import Foundation

extension Polaris.Patron.BasicDataResponse.BasicData {
    
    public struct MessageCounts: Decodable {
        
        // MARK: - Properties
        public private(set) var new: Int?
        public private(set) var read: Int?
        
        // MARK: - Coding Keys
        private enum CodingKeys: String, CodingKey {

            case new = "MessageNewCount"
            case read = "MessageReadCount"
        }
        
        // MARK: - Initialization
        public init(from decoder: Decoder) throws {
            
            let data = try decoder.container(keyedBy: CodingKeys.self)
            
            new = try? data.decode(Int.self, forKey: .new)
            read = try? data.decode(Int.self, forKey: .read)
        }
    }
}
