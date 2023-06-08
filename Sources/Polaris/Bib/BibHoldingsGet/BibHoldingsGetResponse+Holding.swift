import Foundation

extension Polaris.Bib.BibHoldingsGetResponse {
    
    public struct Holding: Decodable {
        
        // MARK: - PROPERTIES
        public let barcode: String?
        public let callNumber: String?
        public let canBeHeld: Bool?
        public let circulation: Circulation
        public let collection: Collection
        public let designation: String?
        public let itemCounts: ItemCounts
        public let location: Location
        public let materialType: String?
        public let notes: Notes
        public let shelfLocation: String?
        public let statements: Statements
        public let volume: String?

        // MARK: - CODING KEYS
        private enum CodingKeys: String, CodingKey {
            case barcode = "Barcode"
            case callNumber = "CallNumber"
            case canBeHeld = "Holdable"
            case designation = "Designation"
            case materialType = "MaterialType"
            case shelfLocation = "ShelfLocation"
            case volume = "VolumeNumber"
        }
        
        // MARK: - INITIALIZATION
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            barcode = try container.decodeIfPresent(String.self, forKey: .barcode)
            callNumber = try container.decodeIfPresent(String.self, forKey: .callNumber)
            canBeHeld = try container.decodeIfPresent(Bool.self, forKey: .canBeHeld)
            circulation = try Circulation(from: decoder)
            collection = try Collection(from: decoder)
            designation = try container.decodeIfPresent(String.self, forKey: .designation)
            itemCounts = try ItemCounts(from: decoder)
            location = try Location(from: decoder)
            materialType = try container.decodeIfPresent(String.self, forKey: .materialType)
            notes = try Notes(from: decoder)
            shelfLocation = try container.decodeIfPresent(String.self, forKey: .shelfLocation)
            statements = try Statements(from: decoder)
            volume = try container.decodeIfPresent(String.self, forKey: .volume)
        }
    }
}
