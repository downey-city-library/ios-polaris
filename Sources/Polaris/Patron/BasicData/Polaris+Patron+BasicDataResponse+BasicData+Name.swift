//
//  Polaris+Patron+BasicDataResponse+BasicData+Name.swift
//  Polaris
//
//  Created by Andrew Despres on 5/12/20.
//  Copyright © 2020 Downey City Library. All rights reserved.
//

import Foundation

extension Polaris.Patron.BasicDataResponse.BasicData {
    
    public struct Name: Decodable {
        
        // MARK: - Properties
        public private(set) var first: String?
        public private(set) var last: String?
        public private(set) var middle: String?
        public private(set) var suffix: String?
        public private(set) var title: Polaris.Patron.NameTitle?
        
        // MARK: - Coding Keys
        private enum CodingKeys: String, CodingKey {

            case first = "NameFirst"
            case last = "NameLast"
            case middle = "NameMiddle"
            case suffix = "NameSuffix"
            case title = "NameTitle"
        }
        
        // MARK: - Initialization
        public init(from decoder: Decoder) throws {
            
            let data = try decoder.container(keyedBy: CodingKeys.self)
            
            first = try? data.decode(String.self, forKey: .first)
            last = try? data.decode(String.self, forKey: .last)
            middle = (try? data.decode(String.self, forKey: .middle))
            suffix = (try? data.decode(String.self, forKey: .suffix))
            title = (try? data.decode(Polaris.Patron.NameTitle.self, forKey: .title))
        }
    }
}
