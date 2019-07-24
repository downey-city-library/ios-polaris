//
//  Patron+Codable.swift
//  Polaris
//
//  Created by Andrew Despres on 7/24/19.
//  Copyright © 2019 Downey City Library. All rights reserved.
//

import Foundation

extension Patron: Decodable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let data = try container.nestedContainer(keyedBy: PatronCodingKeys.self, forKey: .patronData)
        
        self.barcode = try data.decode(String.self, forKey: .barcode)
        self.name = try PatronDecoder.parseName(from: data)
        self.phones = try PatronDecoder.parsePhones(from: data)
        self.emails = try PatronDecoder.parseEmails(from: data)
        self.birthdate = try PatronDecoder.parseDate(from: data, forKey: .birthdate)
        self.registrationDate = try PatronDecoder.parseDate(from: data, forKey: .registrationDate)
        self.lastActivityDate = try PatronDecoder.parseDate(from: data, forKey: .lastActivityDate)
        self.addressCheckDate = try PatronDecoder.parseDate(from: data, forKey: .addressCheckDate)
        self.messageCounts = try PatronDecoder.parseMessageCounts(from: data)
        self.addresses = (try? data.decode([Address].self, forKey: .addresses)) ?? []
        self.itemCounts = try PatronDecoder.parseItemCounts(from: data)
        self.holdRequestCounts = try PatronDecoder.parseHoldRequestCounts(from: data)
        self.balances = try PatronDecoder.parseBalances(from: data)
    }
}
