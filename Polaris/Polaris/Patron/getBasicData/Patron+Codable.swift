//
//  Patron+Codable.swift
//  Polaris
//
//  Created by Andrew Despres on 7/24/19.
//  Copyright © 2019 Downey City Library. All rights reserved.
//

import Foundation

extension Patron {
    // MARK: - Coding Keys
    enum CodingKeys: String, CodingKey {
        case patronData = "PatronBasicData"
        case errorCode = "PAPIErrorCode"
        
        case addressCheckDate = "AddrCheckDate"
        case addresses = "PatronAddresses"
        case barcode = "Barcode"
        case birthdate = "BirthDate"
        case lastActivityDate = "LastActivityDate"
        case registrationDate = "RegistrationDate"
    }
}

extension Patron: Decodable {
    // MARK: - Initialization
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let errorCode = try container.decode(Int.self, forKey: .errorCode)
        self._error = errorCode == 0 ? nil : PolarisError(rawValue: errorCode)
        
        guard let data = try? container.nestedContainer(keyedBy: CodingKeys.self, forKey: .patronData) else { throw self._error! }
        
        // decoded using coding keys
        self._addressCheckDate = (try data.decode(String.self, forKey: .addressCheckDate)).toDate()
        self._addresses = (try? data.decode([Address].self, forKey: .addresses)) ?? []
        self._barcode = try data.decode(String.self, forKey: .barcode)
        self._birthdate = (try data.decode(String.self, forKey: .birthdate)).toDate()
        self._lastActivityDate = (try data.decode(String.self, forKey: .lastActivityDate)).toDate()
        self._registrationDate = (try data.decode(String.self, forKey: .registrationDate)).toDate()
        
        // decoded using child structs
        self._balances = try Balances(from: decoder)
        self._emails = try Emails(from: decoder)
        self._holdRequestCounts = try HoldRequestCounts(from: decoder)
        self._itemCounts = try ItemCounts(from: decoder)
        self._messageCounts = try MessageCounts(from: decoder)
        self._name = try Name(from: decoder)
        self._phones = try Phones(from: decoder)
    }
}
