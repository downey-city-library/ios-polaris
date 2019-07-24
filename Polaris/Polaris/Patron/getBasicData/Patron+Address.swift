//
//  Patron+Address.swift
//  Polaris
//
//  Created by Andrew Despres on 7/24/19.
//  Copyright © 2019 Downey City Library. All rights reserved.
//

import Foundation

extension Patron {
    public struct Address: Decodable {
        public let id: Int
        public let label: String
        public let streetOne: String
        public let streetTwo: String
        public let city: String
        public let state: String
        public let county: String
        public let postalCode: String
        public let zipPlusFour: String
        public let country: String
        public let countryId: Int
        public let typeId: Int
        
        public enum CodingKeys: String, CodingKey {
            case id = "AddressID"
            case label = "FreeTextLabel"
            case streetOne = "StreetOne"
            case streetTwo = "StreetTwo"
            case city = "City"
            case state = "State"
            case county = "County"
            case postalCode = "PostalCode"
            case zipPlusFour = "ZipPlusFour"
            case country = "Country"
            case countryId = "CountryID"
            case typeId = "AddressTypeID"
        }
    }
}

extension Patron.Address {
    public init(from decoder: Decoder) throws {
        let data = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try data.decode(Int.self, forKey: .id)
        self.label = (try? data.decode(String.self, forKey: .label)) ?? ""
        self.streetOne = (try? data.decode(String.self, forKey: .streetOne)) ?? ""
        self.streetTwo = (try? data.decode(String.self, forKey: .streetTwo)) ?? ""
        self.city = (try? data.decode(String.self, forKey: .city)) ?? ""
        self.state = (try? data.decode(String.self, forKey: .state)) ?? ""
        self.county = (try? data.decode(String.self, forKey: .county)) ?? ""
        self.postalCode = (try? data.decode(String.self, forKey: .postalCode)) ?? ""
        self.zipPlusFour = (try? data.decode(String.self, forKey: .zipPlusFour)) ?? ""
        self.country = (try? data.decode(String.self, forKey: .country)) ?? ""
        self.countryId = try data.decode(Int.self, forKey: .countryId)
        self.typeId = try data.decode(Int.self, forKey: .typeId)
    }
}
