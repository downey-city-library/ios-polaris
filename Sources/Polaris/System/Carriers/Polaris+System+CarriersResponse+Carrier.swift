//
//  Polaris+System+CarriersResponse+Carrier.swift
//  Polaris
//
//  Created by Andrew Despres on 5/22/20.
//  Copyright © 2020 Downey City Library. All rights reserved.
//

import Foundation

extension Polaris.System.CarriersResponse {
    
    public struct Carrier: Decodable {
        
        // MARK: - Properties
        public private(set) var ID: Int
        public private(set) var name: String
        public private(set) var smsGateway: String
        public private(set) var digits: Int
        public private(set) var display: Bool
        
        // MARK: - Coding Keys
        private enum CodingKeys: String, CodingKey {
            
            case ID = "CarrierID"
            case name = "CarrierName"
            case smsGateway = "Email2SMSEmailAddress"
            case digits = "NumberOfDigits"
            case display = "Display"
        }
        
        // MARK: - Initialization
        public init(from decoder: Decoder) throws {
            
            let data = try decoder.container(keyedBy: CodingKeys.self)
            
            ID = try data.decode(Int.self, forKey: .ID)
            name = try data.decode(String.self, forKey: .name)
            smsGateway = try data.decode(String.self, forKey: .smsGateway)
            digits = try data.decode(Int.self, forKey: .digits)
            display = try data.decode(Bool.self, forKey: .display)
        }
    }
}
