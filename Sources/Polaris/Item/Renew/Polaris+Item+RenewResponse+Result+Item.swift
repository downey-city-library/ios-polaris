//
//  Polaris+Item+RenewResponse+Result.swift
//  Polaris
//
//  Created by Andrew Despres on 11/5/19.
//  Copyright © 2020 Downey City Library. All rights reserved.
//

import Foundation

extension Polaris.Item.RenewResponse.Result {

    public struct Item: Decodable {

        // MARK: - Properties
        public private(set) var dueDate: Date?
        public private(set) var id: Int

        // MARK: - Coding Keys
        private enum CodingKeys: String, CodingKey {

            case dueDate = "DueDate"
            case id = "ItemRecordID"
        }

        // MARK: - Initialization
        public init(from decoder: Decoder) throws {
            
            let data = try decoder.container(keyedBy: CodingKeys.self)

            dueDate = try? data.decode(String.self, forKey: .dueDate).toDate()
            id = try data.decode(Int.self, forKey: .id)
        }
    }
}
