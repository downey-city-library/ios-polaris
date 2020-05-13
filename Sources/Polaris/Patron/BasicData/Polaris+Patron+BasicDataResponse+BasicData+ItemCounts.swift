//
//  Polaris+Patron+BasicDataResponse+BasicData+ItemCounts.swift
//  Polaris
//
//  Created by Andrew Despres on 5/12/20.
//  Copyright © 2020 Downey City Library. All rights reserved.
//

import Foundation

extension Polaris.Patron.BasicDataResponse.BasicData {
    
    public struct ItemCounts: Decodable {
        
        // MARK: - Properties
        public var lost: Int?
        public var out: Int?
        public var overdue: Int?
        
        // MARK: - Coding Keys
        private enum CodingKeys: String, CodingKey {
            
            case lost = "ItemsOutLostCount"
            case out = "ItemsOutCount"
            case overdue = "ItemsOverdueCount"
        }
        
        // MARK: - Initialization
        public init(from decoder: Decoder) throws {
            
            let data = try decoder.container(keyedBy: CodingKeys.self)
            
            lost = try? data.decode(Int.self, forKey: .lost)
            out = try? data.decode(Int.self, forKey: .out)
            overdue = try? data.decode(Int.self, forKey: .overdue)
        }
        
        // MARK: - Internal Setters
//        internal func refresh() {
//            _lost = Polaris.activePatron?.items?.lost.count
//            _out = Polaris.activePatron?.items?.out.count
//            _overdue = Polaris.activePatron?.items?.overdue.count
//        }
    }
}
