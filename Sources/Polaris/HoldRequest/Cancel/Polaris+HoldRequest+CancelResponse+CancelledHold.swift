//
//  Polaris+HoldRequest+CancelResponse+CancelledHold.swift
//  Polaris
//
//  Created by Andrew Despres on 4/28/20.
//  Copyright © 2020 Downey City Library. All rights reserved.
//

import Foundation

extension Polaris.HoldRequest.CancelResponse {
    
    public struct CancelledHold: Decodable {
        
        // MARK: - Properties
        public private(set) var errorMessage: String?
        public private(set) var ID: Int
        public private(set) var returnCode: Int
        
        // MARK: - Coding Keys
        private enum CodingKeys: String, CodingKey {
            
            case errorMessage = "ErrorMessage"
            case ID = "SysHoldRequestID"
            case returnCode = "ReturnCode"
        }
        
        // MARK: - Initialization
        public init(from decoder: Decoder) throws {
            
            let data = try decoder.container(keyedBy: CodingKeys.self)
            
            errorMessage = try? data.decode(String.self, forKey: .errorMessage)
            ID = try data.decode(Int.self, forKey: .ID)
            returnCode = try data.decode(Int.self, forKey: .returnCode)
        }
    }
}
