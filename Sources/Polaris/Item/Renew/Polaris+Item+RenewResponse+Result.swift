//
//  Polaris+Item+RenewResponse+Result.swift
//  Polaris
//
//  Created by Andrew Despres on 11/5/19.
//  Copyright © 2020 Downey City Library. All rights reserved.
//

import Foundation

extension Polaris.Item.RenewResponse {
    
    public struct Result: Decodable {
    
        // MARK: - Properties
        public private(set) var blocks: [Block]
        public private(set) var items: [Item]
    
        // MARK: - Coding Keys
        private enum CodingKeys: String, CodingKey {
    
            case blockRows = "BlockRows"
            case itemRows = "DueDateRows"
        }
    
        // MARK: - Initialization
        public init(from decoder: Decoder) throws {
            
            let data = try decoder.container(keyedBy: CodingKeys.self)
    
            blocks = try data.decode([Block].self, forKey: .blockRows)
            items = try data.decode([Item].self, forKey: .itemRows)
        }
    }
}
