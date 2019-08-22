//
//  Patron+Address+Codable.swift
//  Polaris
//
//  Created by Andrew Despres on 8/20/19.
//  Copyright © 2019 Downey City Library. All rights reserved.
//

import Foundation

extension Patron.Address {
    // MARK: - Coding Keys
    public enum CodingKeys: String, CodingKey {
        case ID = "AddressID"
        case label = "FreeTextLabel"
        case streetOne = "StreetOne"
        case streetTwo = "StreetTwo"
        case city = "City"
        case state = "State"
        case county = "County"
        case postalCode = "PostalCode"
        case zipPlusFour = "ZipPlusFour"
        case country = "Country"
        case countryID = "CountryID"
        case typeID = "AddressTypeID"
    }
}

extension Patron.Address: Decodable {
    // MARK: - Initialization
    public init(from decoder: Decoder) throws {
        let data = try decoder.container(keyedBy: CodingKeys.self)
        
        self._ID = try data.decode(Int.self, forKey: .ID)
        self._label = (try? data.decode(String.self, forKey: .label)) ?? ""
        self._streetOne = (try? data.decode(String.self, forKey: .streetOne)) ?? ""
        self._streetTwo = (try? data.decode(String.self, forKey: .streetTwo)) ?? ""
        self._city = (try? data.decode(String.self, forKey: .city)) ?? ""
        self._state = (try? data.decode(String.self, forKey: .state)) ?? ""
        self._county = (try? data.decode(String.self, forKey: .county)) ?? ""
        self._postalCode = (try? data.decode(String.self, forKey: .postalCode)) ?? ""
        self._zipPlusFour = (try? data.decode(String.self, forKey: .zipPlusFour)) ?? ""
        self._country = (try? data.decode(String.self, forKey: .country)) ?? ""
        self._countryID = try data.decode(Int.self, forKey: .countryID)
        self._typeID = try data.decode(Int.self, forKey: .typeID)
    }
}
