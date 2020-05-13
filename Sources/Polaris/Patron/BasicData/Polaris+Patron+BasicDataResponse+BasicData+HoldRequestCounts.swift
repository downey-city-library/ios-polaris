//
//  Polaris+Patron+BasicDataResponse+BasicData.swift
//  Polaris
//
//  Created by Andrew Despres on 5/12/20.
//  Copyright © 2020 Downey City Library. All rights reserved.
//

import Foundation

extension Polaris.Patron.BasicDataResponse.BasicData {
    
    public struct HoldRequestCounts: Decodable {
        
        // MARK: - Properties
        public private(set) var current: Int?
        public private(set) var held: Int?
        public private(set) var shipped: Int?
        public private(set) var total: Int?
        public private(set) var unclaimed: Int?
        
        // MARK: - Coding Keys
        private enum CodingKeys: String, CodingKey {

            case current = "HoldRequestsCurrentCount"
            case held = "HoldRequestsHeldCount"
            case shipped = "HoldRequestsShippedCount"
            case total = "HoldRequestsTotalCount"
            case unclaimed = "HoldRequestsUnclaimedCount"
        }
        
        // MARK: - Initialization
        public init(from decoder: Decoder) throws {
            
            let data = try decoder.container(keyedBy: CodingKeys.self)
            
            current = try? data.decode(Int.self, forKey: .current)
            held = try? data.decode(Int.self, forKey: .held)
            shipped = try? data.decode(Int.self, forKey: .shipped)
            total = try? data.decode(Int.self, forKey: .total)
            unclaimed = try? data.decode(Int.self, forKey: .unclaimed)
        }
        
        // MARK: - Internal Setters
//        internal func refresh() {
//            _held = Polaris.activePatron?.holdRequests?.held.count
//            _shipped = Polaris.activePatron?.holdRequests?.shipped.count
//            _total = Polaris.activePatron?.holdRequests?.all.count
//            _unclaimed = Polaris.activePatron?.holdRequests?.unclaimed.count
//            
//            if let active = Polaris.activePatron?.holdRequests?.active, let held = Polaris.activePatron?.holdRequests?.held, let pending = Polaris.activePatron?.holdRequests?.pending {
//                _current = active.count + held.count + pending.count
//            } else {
//                _current = 0
//            }
//        }
    }
}
