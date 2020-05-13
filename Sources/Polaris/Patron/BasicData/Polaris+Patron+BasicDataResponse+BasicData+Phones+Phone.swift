//
//  Polaris+Patron+BasicDataResponse+BasicData+Phones+Phone.swift
//  Polaris
//
//  Created by Andrew Despres on 5/12/20.
//  Copyright © 2020 Downey City Library. All rights reserved.
//

import Foundation

extension Polaris.Patron.BasicDataResponse.BasicData {
    
    public struct Phone {
        
        // MARK: - Properties
        public private(set) var carrier: Polaris.Patron.PhoneCarrier
        public private(set) var number: String?
        
        // MARK: - Initialization
        internal init(number: String?, carrier: Int?) {
            
            if let carrier = carrier { self.carrier = Polaris.Patron.PhoneCarrier(rawValue: carrier) ?? .noCarrier }
            else { self.carrier = .noCarrier }
            self.number = number
        }
        
        // MARK: - Public Setters
//        public func carrier(id: Int?) {
//            guard let id = id else { return }
//
//            _carrier = PhoneCarrier(rawValue: id) ?? .noCarrier
//        }
        
//        public func number(string: String?) {
//            guard let string = string else { return }
//
//            _number = string
//        }
    }
}
