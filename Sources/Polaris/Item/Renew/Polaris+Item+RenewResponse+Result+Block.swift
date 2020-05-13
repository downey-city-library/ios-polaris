//
//  Polaris+Item+RenewResponse+Result+Block.swift
//  Polaris
//
//  Created by Andrew Despres on 11/5/19.
//  Copyright © 2020 Downey City Library. All rights reserved.
//

import Foundation

extension Polaris.Item.RenewResponse.Result {

    public struct Block: Decodable {

        // MARK: - Properties
        public private(set) var allowsOverride: Bool
        public private(set) var code: Int
        public private(set) var description: String
        public private(set) var itemId: Int
        public private(set) var type: Int

        // MARK: - Coding Keys
        private enum CodingKeys: String, CodingKey {

            case allowsOverride = "ErrorAllowOverride"
            case errorCode = "PolarisErrorCode"
            case errorDescription = "ErrorDesc"
            case errorType = "PAPIErrorType"
            case itemId = "ItemRecordID"
        }

        // MARK: - Initialization
        public init(from decoder: Decoder) throws {
            
            let data = try decoder.container(keyedBy: CodingKeys.self)

            allowsOverride = try data.decode(Bool.self, forKey: .allowsOverride)
            code = try data.decode(Int.self, forKey: .errorCode)
            description = try data.decode(String.self, forKey: .errorDescription)
            itemId = try data.decode(Int.self, forKey: .itemId)
            type = try data.decode(Int.self, forKey: .errorType)
        }
    }
}
