//
//  Patron+Phones+Phone+Codable.swift
//  Polaris
//
//  Created by Andrew Despres on 8/21/19.
//  Copyright © 2019 Downey City Library. All rights reserved.
//

import Foundation

extension Patron.Phones.Phone {
    // MARK: - Coding Keys
    fileprivate enum CodingKeys: String, CodingKey {
        case number1 = "PhoneNumber"
        case number2 = "PhoneNumber2"
        case number3 = "PhoneNumber3"
        case carrier1 = "Phone1CarrierID"
        case carrier2 = "Phone2CarrierID"
        case carrier3 = "Phone3CarrierID"
        case cell = "CellPhone"
    }
}

extension Patron.Phones.Phone {
    // MARK: - Initialization
    internal init(from decoder: Decoder, forIndex index: Int) throws {
        let container = try decoder.container(keyedBy: Patron.CodingKeys.self)
        let data = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .patronData)
        
        let cell = try? data.decode(String.self, forKey: .cell)
        
        switch index {
        case 1:
            self._number = try data.decode(String.self, forKey: .number1)
            self._carrier = try data.decode(Carrier.self, forKey: .carrier1)
            self._useForTXT = cell == self._number ? true : false
            
        case 2:
            self._number = try data.decode(String.self, forKey: .number2)
            self._carrier = try data.decode(Carrier.self, forKey: .carrier2)
            self._useForTXT = cell == self._number ? true : false
            
        case 3:
            self._number = try data.decode(String.self, forKey: .number3)
            self._carrier = try data.decode(Carrier.self, forKey: .carrier3)
            self._useForTXT = cell == self._number ? true : false
            
        default: throw PolarisError.generalError
        }
    }
}
