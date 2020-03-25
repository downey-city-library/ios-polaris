//
//  Preferences.swift
//  Polaris
//
//  Created by Andrew Despres on 10/10/19.
//  Copyright © 2019 Downey City Library. All rights reserved.
//

import Foundation

extension Patron {

    public class Preferences: Decodable {
        
        // MARK: - Private Properties (Get/Set)
        private var _deliveryEmail: DeliveryEmail
        private var _deliveryMethod: DeliveryMethod
        private var _readingList: ReadingList
        
        // MARK: - Public Properties (Get Only)
        public var deliveryEmail: DeliveryEmail { return _deliveryEmail }
        public var deliveryMethod: DeliveryMethod { return _deliveryMethod }
        public var readingList: ReadingList { return _readingList }
        
        // MARK: - Initialization
        public required init(from decoder: Decoder) throws {
            _deliveryEmail = try DeliveryEmail(from: decoder)
            _deliveryMethod = try DeliveryMethod(from: decoder)
            _readingList = try ReadingList(from: decoder)
        }
    }
}

// MARK: - Patron + Preferences + DeliveryEmail
extension Patron.Preferences {
    
    public class DeliveryEmail {
        
        // MARK: - Private Properties (Get/Set)
        private var _format: Format
        
        // MARK: - Public Properties (Get Only)
        public var format: Format { return _format }
        
        // MARK: - Initialization
        public required init(from decoder: Decoder) throws {
            _format = try Format(from: decoder)
        }
    }
}

// MARK: - Patron + Preferences + DeliveryEmail + Format
extension Patron.Preferences.DeliveryEmail {
    
    public class Format {
        
        // MARK: - Private Properties (Get/Set)
        private var _description: String?
        private var _id: Int?
        
        // MARK: - Public Properties (Get Only)
        public var description: String? { return _description }
        public var id: Int? { return _id }
        
        // MARK: - Coding Keys
        private enum CodingKeys: String, CodingKey {
            
            case description = "DeliveryEmailFormatDescription"
            case id = "DeliveryEmailFormatID"
        }
        
        // MARK: - Initialization
        public required init(from decoder: Decoder) throws {
            let data = try decoder.container(keyedBy: CodingKeys.self)
            
            _description = try? data.decode(String.self, forKey: .description)
            _id = try? data.decode(Int.self, forKey: .id)
        }
    }
}

// MARK: - Patron + Preferences + DeliveryMethod
extension Patron.Preferences {
    
    public class DeliveryMethod {
        
        // MARK: - Private Properties (Get/Set)
        private var _description: String?
        private var _id: Int?
        
        // MARK: - Public Properties (Get Only)
        public var description: String? { return _description }
        public var id: Int? { return _id }
        
        // MARK: - Coding Keys
        private enum CodingKeys: String, CodingKey {
            
            case description = "DeliveryMethodDescription"
            case id = "DeliveryMethodID"
        }
        
        // MARK: - Initialization
        public required init(from decoder: Decoder) throws {
            let data = try decoder.container(keyedBy: CodingKeys.self)
            
            _description = try? data.decode(String.self, forKey: .description)
            _id = try? data.decode(Int.self, forKey: .id)
        }
    }
}

// MARK: - Patron + Preferences + ReadingList
extension Patron.Preferences {
    
    public class ReadingList {
        
        // MARK: - Private Properties (Get/Set)
        private var _isEnabled: Bool?
        
        // MARK: - Public Properties (Get Only)
        public var isEnabled: Bool? { return _isEnabled }
        
        // MARK: - Coding Keys
        private enum CodingKeys: String, CodingKey {
            
            case isEnabled = "ReadingListEnabled"
        }
        
        // MARK: - Initialization
        public required init(from decoder: Decoder) throws {
            let data = try decoder.container(keyedBy: CodingKeys.self)
            
            _isEnabled = try? data.decode(Bool.self, forKey: .isEnabled)
        }
    }
}
