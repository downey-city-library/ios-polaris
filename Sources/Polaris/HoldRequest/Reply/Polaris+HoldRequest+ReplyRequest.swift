//
//  Polaris+HoldRequest+ReplyRequest.swift
//  Polaris
//
//  Created by Andrew Despres on 5/11/20.
//  Copyright © 2020 Downey City Library. All rights reserved.
//

import Foundation

extension Polaris.HoldRequest {
    
    public struct ReplyRequest: Encodable {
        
        // MARK: - Properties
        public private(set) var groupQualifier: String
        public private(set) var transactionQualifier: String
        public private(set) var organizationId: Int
        public private(set) var answer: Int
        public private(set) var state: Int
        
        // MARK: - Coding Keys
        private enum CodingKeys: String, CodingKey {
            
            case groupQualifier = "TxnGroupQualifier"
            case transactionQualifier = "TxnQualifier"
            case organizationId = "RequestingOrgID"
            case answer = "Answer"
            case state = "State"
        }
        
        // MARK: - Initialization
        public init(groupQualifier: String, transactionQualifier: String, organizationId: Int, answer: Answer, state: State) {
            
            self.groupQualifier = groupQualifier
            self.transactionQualifier = transactionQualifier
            self.organizationId = organizationId
            self.answer = answer.int
            self.state = state.int
        }
    }
}
