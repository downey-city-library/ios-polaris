//
//  Polaris+Bib+GetHoldingsResponse+Holding+Circulation.swift
//  Polaris
//
//  Created by Andrew Despres on 4/27/20.
//  Copyright © 2020 Downey City Library. All rights reserved.
//

import Foundation

extension Polaris.Bib.GetHoldingsResponse.Holding {
    
    public struct Circulation {
        
        // MARK: - Properties
        public private(set) var dueDate: Date?
        public private(set) var lastCirculated: Date?
        public private(set) var status: String?
        
        // MARK: - Coding Keys
        fileprivate enum CodingKeys: String, CodingKey {

            case dueDate = "DueDate"
            case lastCirculated = "LastCircDate"
            case status = "CircStatus"
        }
        
        // MARK: - Initialization
        public init(from decoder: Decoder) throws {
            
            let data = try decoder.container(keyedBy: CodingKeys.self)
            
            dueDate = try? data.decode(String.self, forKey: .dueDate).toDate()
            lastCirculated = try? data.decode(String.self, forKey: .lastCirculated).toDate()
            status = try? data.decode(String.self, forKey: .status)
        }
        
        public init(
            dueDate: Date? = nil,
            lastCirculated: Date? = nil,
            status: String? = nil) {
            self.dueDate = dueDate
            self.lastCirculated = lastCirculated
            self.status = status
        }
    }
}
