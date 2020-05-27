//
//  Polaris+Patron+BasicDataResponse+BasicData.swift
//  Polaris
//
//  Created by Andrew Despres on 5/12/20.
//  Copyright © 2020 Downey City Library. All rights reserved.
//

import Foundation

extension Polaris.Patron.BasicDataResponse {
    
    public struct BasicData: Decodable {
                        
        // MARK: - Properties
        public private(set) var addressCheckDate: Date?
        public private(set) var addresses: [Address]
        public private(set) var balances: Balances
        public private(set) var barcode: String?
        public private(set) var birthdate: Date?
        public var emails: Emails
        public private(set) var holdRequestCounts: HoldRequestCounts
        public private(set) var id: Int?
        public private(set) var itemCounts: ItemCounts
        public private(set) var lastActivityDate: Date?
        public private(set) var messageCounts: MessageCounts
        public private(set) var name: Name
        public var phones: Phones
        public private(set) var registrationDate: Date?
        
        // MARK: - Coding Keys
        private enum CodingKeys: String, CodingKey {
            
            case addressCheckDate = "AddrCheckDate"
            case addresses = "PatronAddresses"
            case barcode = "Barcode"
            case birthdate = "BirthDate"
            case id = "PatronID"
            case lastActivityDate = "LastActivityDate"
            case registrationDate = "RegistrationDate"
        }
        
        // MARK: - Initialization
        public init(from decoder: Decoder) throws {
            
            let data = try decoder.container(keyedBy: CodingKeys.self)
            
            addressCheckDate = (try? data.decode(String.self, forKey: .addressCheckDate))?.toDate()
            addresses = (try? data.decode([Address].self, forKey: .addresses)) ?? []
            balances = try Balances(from: decoder)
            barcode = try? data.decode(String.self, forKey: .barcode)
            birthdate = (try? data.decode(String.self, forKey: .birthdate))?.toDate()
            emails = try Emails(from: decoder)
            holdRequestCounts = try HoldRequestCounts(from: decoder)
            id = try? data.decode(Int.self, forKey: .id)
            itemCounts = try ItemCounts(from: decoder)
            lastActivityDate = (try? data.decode(String.self, forKey: .lastActivityDate))?.toDate()
            messageCounts = try MessageCounts(from: decoder)
            name = try Name(from: decoder)
            phones = try Phones(from: decoder)
            registrationDate = (try? data.decode(String.self, forKey: .registrationDate))?.toDate()
        }
    }
}
