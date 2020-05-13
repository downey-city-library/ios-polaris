//
//  Polaris+Patron+BasicDataResponse+BasicData+Address.swift
//  Polaris
//
//  Created by Andrew Despres on 5/12/20.
//  Copyright © 2020 Downey City Library. All rights reserved.
//

import Foundation

extension Polaris.Patron.BasicDataResponse.BasicData {
    
    public struct Address: Decodable {
        
        // MARK: - Properties
        public private(set) var city: String?
        public private(set) var county: String?
        public private(set) var country: String?
        public private(set) var countryId: Int?
        public private(set) var ID: Int?
        public private(set) var label: String?
        public private(set) var postalCode: String?
        public private(set) var state: String?
        public private(set) var streetOne: String?
        public private(set) var streetTwo: String?
        public private(set) var typeID: Int?
        public private(set) var zipPlusFour: String?
        
        // MARK: - Coding Keys
        private enum CodingKeys: String, CodingKey {
            
            case city = "City"
            case county = "County"
            case country = "Country"
            case countryId = "CountryID"
            case ID = "AddressID"
            case label = "FreeTextLabel"
            case postalCode = "PostalCode"
            case state = "State"
            case streetOne = "StreetOne"
            case streetTwo = "StreetTwo"
            case typeID = "AddressTypeID"
            case zipPlusFour = "ZipPlusFour"
        }
        
        // MARK: - Initialization
        public init(from decoder: Decoder) throws {
            
            let data = try decoder.container(keyedBy: CodingKeys.self)
            
            city = try? data.decode(String.self, forKey: .city)
            county = try? data.decode(String.self, forKey: .county)
            country = try? data.decode(String.self, forKey: .country)
            countryId = try? data.decode(Int.self, forKey: .countryId)
            ID = try? data.decode(Int.self, forKey: .ID)
            label = try? data.decode(String.self, forKey: .label)
            postalCode = try? data.decode(String.self, forKey: .postalCode)
            state = try? data.decode(String.self, forKey: .state)
            streetOne = try? data.decode(String.self, forKey: .streetOne)
            streetTwo = try? data.decode(String.self, forKey: .streetTwo)
            typeID = try? data.decode(Int.self, forKey: .typeID)
            zipPlusFour = try? data.decode(String.self, forKey: .zipPlusFour)
        }
    }
}
