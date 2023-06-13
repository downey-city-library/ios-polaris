import Foundation

extension Polaris.System.RemoteStorageItemsGetResponse {
    
    public struct RemoteStorageItem: Decodable {
        
        // MARK: - PROPERTIES        
        public let id: Int
        public let bibliographicRecord: Int
        public let barcode: String
        public let browseTitle: String
        public let browseAuthor: String?
        public let materialTypeID: Int
        public let materialType: String
        public let collectionID: Int
        public let collection: String
        public let shelfLocationID: Int?
        public let shelfLocation: String?
        public let callNumber: String
        public let copyNumber: String?
        public let volumeNumber: String?

        // MARK: - CODING KEYS
        enum CodingKeys: String, CodingKey {
            case id = "ItemRecordID"
            case bibliographicRecord = "BibliographicRecordID"
            case barcode = "Barcode"
            case browseTitle = "BrowseTitle"
            case browseAuthor = "BrowseAuthor"
            case materialTypeID = "MaterialTypeID"
            case materialType = "MaterialType"
            case collectionID = "CollectionID"
            case collection = "Collection"
            case shelfLocationID = "ShelfLocationID"
            case shelfLocation = "ShelfLocation"
            case callNumber = "CallNumber"
            case copyNumber = "CopyNumber"
            case volumeNumber = "VolumeNumber"
        }
        
        // MARK: - INITIALIZATION
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            id = try container.decode(Int.self, forKey: .id)
            bibliographicRecord = try container.decode(Int.self, forKey: .bibliographicRecord)
            barcode = try container.decode(String.self, forKey: .barcode)
            browseTitle = try container.decode(String.self, forKey: .browseTitle)
            browseAuthor = try container.decodeIfPresent(String.self, forKey: .browseAuthor)
            materialTypeID = try container.decode(Int.self, forKey: .materialTypeID)
            materialType = try container.decode(String.self, forKey: .materialType)
            collectionID = try container.decode(Int.self, forKey: .collectionID)
            collection = try container.decode(String.self, forKey: .collection)
            shelfLocationID = try container.decodeIfPresent(Int.self, forKey: .shelfLocationID)
            shelfLocation = try container.decodeIfPresent(String.self, forKey: .shelfLocation)
            callNumber = try container.decode(String.self, forKey: .callNumber)
            copyNumber = try container.decodeIfPresent(String.self, forKey: .copyNumber)
            volumeNumber = try container.decodeIfPresent(String.self, forKey: .volumeNumber)
        }
    }
}
