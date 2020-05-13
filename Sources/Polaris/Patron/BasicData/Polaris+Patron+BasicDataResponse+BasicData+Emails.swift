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
//        public func alternate(string: String?) {
//            guard let string = string else { return }
//            
//            _alternate = string
//        }
        
//        public func primary(string: String?) {
//            guard let string = string else { return }
//            
//            _primary = string
//        }
    }
}
