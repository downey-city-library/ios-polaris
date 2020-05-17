//
//  Polaris+Patron+BasicDataResponse+BasicData+Emails.swift
//  Polaris
//
//  Created by Andrew Despres on 5/12/20.
//  Copyright © 2020 Downey City Library. All rights reserved.
//

import Foundation

extension Polaris.Patron.BasicDataResponse.BasicData {
    
    public struct Emails {
        
        // MARK: - Properties
        public private(set) var alternate: String?
        public private(set) var primary: String?
        
        // MARK: - Coding Keys
        private enum CodingKeys: String, CodingKey {

            case alternate = "AltEmailAddress"
            case primary = "EmailAddress"
        }
        
        // MARK: - Initialization
        public init(from decoder: Decoder) throws {
            
            let data = try decoder.container(keyedBy: CodingKeys.self)
            
            alternate = try? data.decode(String.self, forKey: .alternate)
            primary = try? data.decode(String.self, forKey: .primary)
        }
        
        // MARK: - Public Setters
        public mutating func set(alternate email: String?) {
            guard let email = email else { return }
            
            self.alternate = email
        }
        
        public mutating func set(primary email: String?) {
            guard let email = email else { return }
            
            self.primary = email
        }
    }
}
