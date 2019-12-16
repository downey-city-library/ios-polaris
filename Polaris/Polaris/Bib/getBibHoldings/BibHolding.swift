//
//  BibHoldingsRow.swift
//  Polaris
//
//  Created by Andrew Despres on 12/10/19.
//  Copyright © 2019 Downey City Library. All rights reserved.
//

import Foundation

public struct BibHolding: Decodable {
    
    // MARK: - Private Properties (Get/Set)
    private var _barcode: String?
    private var _callNumber: String?
    private var _canBeHeld: Bool?
    private var _circulation: Circulation
    private var _collection: Collection
    private var _designation: String?
    private var _itemCounts: ItemCounts
    private var _location: Location
    private var _materialType: String?
    private var _notes: Notes
    private var _shelfLocation: String?
    private var _statements: Statements
    private var _volume: String?
    
    // MARK: - Public Properties (Get Only)
    public var barcode: String? { get { return _barcode } }
    public var callNumber: String? { get { return _callNumber } }
    public var canBeHeld: Bool? { get { return _canBeHeld } }
    public var circulation: Circulation { get { return _circulation } }
    public var collection: Collection { get { return _collection } }
    public var designation: String? { get { return _designation } }
    public var itemCounts: ItemCounts { get { return _itemCounts } }
    public var location: Location { get { return _location } }
    public var materialType: String? { get { return _materialType } }
    public var notes: Notes { get { return _notes } }
    public var shelfLocation: String? { get { return _shelfLocation } }
    public var statements: Statements { get { return _statements } }
    public var volume: String? { get { return _volume } }

    // MARK: - Coding Keys
    fileprivate enum CodingKeys: String, CodingKey {
        
        case barcode = "Barcode"
        case callNumber = "CallNumber"
        case canBeHeld = "Holdable"
        case designation = "Designation"
        case materialType = "MaterialType"
        case shelfLocation = "ShelfLocation"
        case volume = "VolumeNumber"
    }
    
    // MARK: - Initialization
    public init(from decoder: Decoder) throws {
        let data = try decoder.container(keyedBy: CodingKeys.self)
        
        _barcode = try? data.decode(String.self, forKey: .barcode)
        _callNumber = try? data.decode(String.self, forKey: .callNumber)
        _canBeHeld = try? data.decode(Bool.self, forKey: .canBeHeld)
        _circulation = try Circulation(from: decoder)
        _collection = try Collection(from: decoder)
        _designation = try? data.decode(String.self, forKey: .designation)
        _itemCounts = try ItemCounts(from: decoder)
        _location = try Location(from: decoder)
        _materialType = try? data.decode(String.self, forKey: .materialType)
        _notes = try Notes(from: decoder)
        _shelfLocation = try? data.decode(String.self, forKey: .shelfLocation)
        _statements = try Statements(from: decoder)
        _volume = try? data.decode(String.self, forKey: .volume)
    }
}

// MARK: - Debug Description
extension BibHolding: CustomStringConvertible {

    public var description: String {
        var description = "\n:: Start of Debug Description for BibHolding ::\n\n"
        
        description += "barcode: \(barcode as Any)\n"
        description += "callNumber: \(callNumber as Any)\n"
        description += "canBeHeld: \(canBeHeld as Any)\n"
        description += "designation: \(designation as Any)\n"
        description += "materialType: \(materialType as Any)\n"
        description += "shelfLocation: \(shelfLocation as Any)\n"
        description += "volume: \(volume as Any)\n\n"
        
        description += "circulation >> dueDate: \(circulation.dueDate as Any)\n"
        description += "circulation >> lastCirculated: \(circulation.lastCirculated as Any)\n"
        description += "circulation >> status: \(circulation.status as Any)\n\n"
        
        description += "collection >> id: \(collection.id as Any)\n"
        description += "collection >> name: \(collection.name as Any)\n\n"
        
        description += "itemCounts >> in: \(itemCounts.in as Any)\n"
        description += "itemCounts >> total: \(itemCounts.total as Any)\n\n"
        
        description += "location >> id: \(location.id as Any)\n"
        description += "location >> name: \(location.name as Any)\n\n"
        
        description += "notes >> holdings: \(notes.holdings as Any)\n"
        description += "notes >> public: \(notes.public as Any)\n"
        description += "notes >> textualHoldings: \(notes.textualHoldings as Any)\n\n"
        
        description += "statements >> holdings: \(statements.holdings as Any)\n"
        description += "statements >> retention: \(statements.retention as Any)\n"

        description += "\n:: End of Debug Description for BibHolding ::\n"
        
        return description
    }
}

// MARK: - BibHolding + Circulation
extension BibHolding {
    
    public struct Circulation {
        
        // MARK: - Private Properties
        private var _dueDate: Date?
        private var _lastCirculated: Date?
        private var _status: String?
        
        // MARK: - Public Properties
        public var dueDate: Date? { get { return _dueDate } }
        public var lastCirculated: Date? { get { return _lastCirculated } }
        public var status: String? { get { return _status } }
        
        // MARK: - Coding Keys
        fileprivate enum CodingKeys: String, CodingKey {

            case dueDate = "DueDate"
            case lastCirculated = "LastCircDate"
            case status = "CircStatus"
        }
        
        // MARK: - Initialization
        public init(from decoder: Decoder) throws {
            let data = try decoder.container(keyedBy: CodingKeys.self)
            
            _dueDate = try? data.decode(String.self, forKey: .dueDate).toDate()
            _lastCirculated = try? data.decode(String.self, forKey: .lastCirculated).toDate()
            _status = try? data.decode(String.self, forKey: .status)
        }
    }
}

// MARK: - BibHolding + Collection
extension BibHolding {
    
    public struct Collection {
        
        // MARK: - Private Properties
        private var _id: Int?
        private var _name: String?
        
        // MARK: - Public Properties
        public var id: Int? { get { return _id } }
        public var name: String? { get { return _name } }
        
        // MARK: - Coding Keys
        fileprivate enum CodingKeys: String, CodingKey {

            case id = "CollectionID"
            case name = "CollectionName"
        }
        
        // MARK: - Initialization
        public init(from decoder: Decoder) throws {
            let data = try decoder.container(keyedBy: CodingKeys.self)
            
            _id = try? data.decode(Int.self, forKey: .id)
            _name = try? data.decode(String.self, forKey: .name)
        }
    }
}

// MARK: - BibHolding + ItemCounts
extension BibHolding {
    
    public struct ItemCounts {
        
        // MARK: - Private Properties
        private var _in: Int?
        private var _total: Int?
        
        // MARK: - Public Properties
        public var `in`: Int? { get { return _in } }
        public var total: Int? { get { return _total } }
        
        // MARK: - Coding Keys
        fileprivate enum CodingKeys: String, CodingKey {
            
            case `in` = "ItemsIn"
            case total = "ItemsTotal"
        }
        
        // MARK: - Initialization
        public init(from decoder: Decoder) throws {
            let data = try decoder.container(keyedBy: CodingKeys.self)
            
            _in = try? data.decode(Int.self, forKey: .in)
            _total = try? data.decode(Int.self, forKey: .total)
        }
    }
}

// MARK: - BibHolding + Location
extension BibHolding {
    
    public struct Location {
        
        // MARK: - Private Properties
        private var _id: Int?
        private var _name: String?
        
        // MARK: - Public Properties
        public var id: Int? { get { return _id } }
        public var name: String? { get { return _name } }
        
        // MARK: - Coding Keys
        fileprivate enum CodingKeys: String, CodingKey {

            case id = "LocationID"
            case name = "LocationName"
        }
        
        // MARK: - Initialization
        public init(from decoder: Decoder) throws {
            let data = try decoder.container(keyedBy: CodingKeys.self)
            
            _id = try? data.decode(Int.self, forKey: .id)
            _name = try? data.decode(String.self, forKey: .name)
        }
    }
}

// MARK: - BibHolding + Notes
extension BibHolding {
    
    public struct Notes {
        
        // MARK: - Private Properties
        private var _holdings: String?
        private var _public: String?
        private var _textualHoldings: String?
        
        // MARK: - Public Properties
        public var holdings: String? { get { return _holdings } }
        public var `public`: String? { get { return _public } }
        public var textualHoldings: String? { get { return _textualHoldings } }
        
        // MARK: - Coding Keys
        fileprivate enum CodingKeys: String, CodingKey {

            case holdings = "HoldingsNote"
            case `public` = "PublicNote"
            case textualHoldings = "TextualHoldingsNote"
        }
        
        // MARK: - Initialization
        public init(from decoder: Decoder) throws {
            let data = try decoder.container(keyedBy: CodingKeys.self)
            
            _holdings = try? data.decode(String.self, forKey: .holdings)
            _public = try? data.decode(String.self, forKey: .public)
            _textualHoldings = try? data.decode(String.self, forKey: .textualHoldings)
        }
    }
}

// MARK: - BibHolding + Statements
extension BibHolding {
    
    public struct Statements {
        
        // MARK: - Private Properties
        private var _holdings: String?
        private var _retention: String?
        
        // MARK: - Public Properties
        public var holdings: String?
        public var retention: String?
        
        // MARK: - Coding Keys
        fileprivate enum CodingKeys: String, CodingKey {
            
            case holdings = "HoldingsStatement"
            case retention = "RetentionStatement"
        }
        
        // MARK: - Initialization
        public init(from decoder: Decoder) throws {
            let data = try decoder.container(keyedBy: CodingKeys.self)
            
            _holdings = try? data.decode(String.self, forKey: .holdings)
            _retention = try? data.decode(String.self, forKey: .retention)
        }
    }
}
