//
//  CreateHoldResponse.swift
//  Polaris
//
//  Created by Andrew Despres on 4/26/20.
//  Copyright © 2020 Downey City Library. All rights reserved.
//

import Foundation

public struct CreateHoldResponse: Decodable {
    
    // MARK: - Properties
    public private(set) var error: PolarisError?
    public private(set) var requestGUID: String
    public private(set) var transactionGroupQualifier: String
    public private(set) var transactionQualifier: String
    public private(set) var statusType: StatusType
    public private(set) var statusValue: StatusValue
    public private(set) var message: String
    public private(set) var queuePosition: Int
    public private(set) var queueTotal: Int
    
    
    // MARK: - Coding Keys
    private enum CodingKeys: String, CodingKey {
        
        case errorCode = "PAPIErrorCode"
        case requestGUID = "RequestGUID"
        case transactionGroupQualifier = "TxnGroupQualifer"
        case transactionQualifier = "TxnQualifier"
        case statusType = "StatusType"
        case statusValue = "StatusValue"
        case message = "Message"
        case queuePosition = "QueuePosition"
        case queueTotal = "QueueTotal"
    }
    
    // MARK: - Initialization
    public init(from decoder: Decoder) throws {
        let data = try decoder.container(keyedBy: CodingKeys.self)
        let errorCode = try data.decode(Int.self, forKey: .errorCode)
        
        error = errorCode == 0 ? nil : PolarisError(rawValue: errorCode)
        requestGUID = try data.decode(String.self, forKey: .requestGUID)
        transactionGroupQualifier = try data.decode(String.self, forKey: .transactionGroupQualifier)
        transactionQualifier = try data.decode(String.self, forKey: .transactionQualifier)
        statusType = try data.decode(StatusType.self, forKey: .statusType)
        statusValue = try data.decode(StatusValue.self, forKey: .statusValue)
        message = try data.decode(String.self, forKey: .message)
        queuePosition = try data.decode(Int.self, forKey: .queuePosition)
        queueTotal = try data.decode(Int.self, forKey: .queueTotal)
    }
}
