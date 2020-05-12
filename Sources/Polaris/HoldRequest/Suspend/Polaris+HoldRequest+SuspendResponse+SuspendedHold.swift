//
//  Polaris+HoldRequest+SuspendResponse+SuspendedHold.swift
//  Polaris
//
//  Created by Andrew Despres on 5/11/20.
//  Copyright © 2020 Downey City Library. All rights reserved.
//

import Foundation

extension Polaris.HoldRequest.SuspendResponse {

    public struct SuspendedHold: Decodable {
        
        // MARK: - Public Properties
        public private(set) var code: Int
        public private(set) var errorMessage: String?
        public private(set) var newActivationDate: Date?
        public private(set) var newExpirationDate: Date?
        public private(set) var requestID: Int
        
        // MARK: - Coding Keys
        private enum CodingKeys: String, CodingKey {
            case code = "ReturnCode"
            case errorMessage = "ErrorMessage"
            case newActivationDate = "NewActivationDate"
            case newExpirationDate = "NewExpirationDate"
            case requestID = "SystemHoldRequestID"
        }
        
        // MARK: - Initialization
        public init(from decoder: Decoder) throws {
            
            let data = try decoder.container(keyedBy: CodingKeys.self)
            
            code = try data.decode(Int.self, forKey: .code)
            print("code", code)
            
            errorMessage = try? data.decode(String.self, forKey: .errorMessage)
            print("errorMessage", errorMessage as Any)
            
            newActivationDate = try? (data.decode(String.self, forKey: .newActivationDate)).toDate()
            print("newActivationDate", newActivationDate as Any)
            
            newExpirationDate = try? (data.decode(String.self, forKey: .newExpirationDate)).toDate()
            print("newExpirationDate", newExpirationDate as Any)
            
            requestID = try data.decode(Int.self, forKey: .requestID)
            print("requestID", requestID)
        }
    }
}
