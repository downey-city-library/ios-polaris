//
//  Polaris+Item+RenewRequest+RenewData.swift
//  Polaris
//
//  Created by Andrew Despres on 11/5/19.
//  Copyright © 2020 Downey City Library. All rights reserved.
//

import Foundation

extension Polaris.Item.RenewRequest {

    public struct RenewData: Encodable {
    
        // MARK: - Public Properties
        public var ignoreErrors: Bool
    
        // MARK: - Coding Keys
        private enum CodingKeys: String, CodingKey {
    
            case ignoreErrors = "IgnoreOverrideErrors"
        }
    
        // MARK: - Initialization
        public init(ignoreErrors: Bool) {
            
            self.ignoreErrors = ignoreErrors
        }
    }
}
