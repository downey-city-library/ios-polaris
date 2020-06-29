//
//  Polaris+Bib+GetHoldingsResponse+Holding.swift
//  Polaris
//
//  Created by Andrew Despres on 12/10/19.
//  Copyright © 2020 Downey City Library. All rights reserved.
//

import Foundation

extension Polaris.Bib.GetHoldingsResponse {
    
    public struct Holding: Decodable {
        
        // MARK: - Properties
        public private(set) var barcode: String?
        public private(set) var callNumber: String?
        public private(set) var canBeHeld: Bool?
        public private(set) var circulation: Circulation
        public private(set) var collection: Collection
        public private(set) var designation: String?
        public private(set) var itemCounts: ItemCounts
        public private(set) var location: Location
        public private(set) var materialType: String?
        public private(set) var notes: Notes
        public private(set) var shelfLocation: String?
        public private(set) var statements: Statements
        public private(set) var volume: String?

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
            
            barcode = try? data.decode(String.self, forKey: .barcode)
            callNumber = try? data.decode(String.self, forKey: .callNumber)
            canBeHeld = try? data.decode(Bool.self, forKey: .canBeHeld)
            circulation = try Circulation(from: decoder)
            collection = try Collection(from: decoder)
            designation = try? data.decode(String.self, forKey: .designation)
            itemCounts = try ItemCounts(from: decoder)
            location = try Location(from: decoder)
            materialType = try? data.decode(String.self, forKey: .materialType)
            notes = try Notes(from: decoder)
            shelfLocation = try? data.decode(String.self, forKey: .shelfLocation)
            statements = try Statements(from: decoder)
            volume = try? data.decode(String.self, forKey: .volume)
        }
        
        public init(
            barcode: String? = nil,
            callNumber: String? = nil,
            canBeHeld: Bool? = nil,
            circulation: Polaris.Bib.GetHoldingsResponse.Holding.Circulation,
            collection: Polaris.Bib.GetHoldingsResponse.Holding.Collection,
            designation: String? = nil,
            itemCounts: Polaris.Bib.GetHoldingsResponse.Holding.ItemCounts,
            location: Polaris.Bib.GetHoldingsResponse.Holding.Location,
            materialType: String? = nil,
            notes: Polaris.Bib.GetHoldingsResponse.Holding.Notes,
            shelfLocation: String? = nil,
            statements: Polaris.Bib.GetHoldingsResponse.Holding.Statements,
            volume: String? = nil) {
            self.barcode = barcode
            self.callNumber = callNumber
            self.canBeHeld = canBeHeld
            self.circulation = circulation
            self.collection = collection
            self.designation = designation
            self.itemCounts = itemCounts
            self.location = location
            self.materialType = materialType
            self.notes = notes
            self.shelfLocation = shelfLocation
            self.statements = statements
            self.volume = volume
        }
    }
}
