import Foundation

extension Polaris.System {
    
    public struct RemoteStorageItemsGetResponse: Decodable, PolarisResponse {
        
        // MARK: - PROPERTIES
        public let error: PolarisError?
        public let itemsFound: Int
        public let itemsReturned: Int
        public let remoteStorageItems: [RemoteStorageItem]

        // MARK: - CODING KEYS
        enum CodingKeys: String, CodingKey {
            case errorCode = "PAPIErrorCode"
            case itemsFound = "RecordCount"
            case itemsReturned = "RowCount"
            case remoteStorageItems = "RemoteStorageItemsGetRows"
        }

        // MARK: - INITIALIZATION
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            let errorCode = try container.decode(Int.self, forKey: .errorCode)
            
            error = errorCode == 0 ? nil : PolarisError(rawValue: errorCode)
            itemsFound = try container.decode(Int.self, forKey: .itemsFound)
            itemsReturned = try container.decode(Int.self, forKey: .itemsReturned)
            remoteStorageItems = try container.decode([RemoteStorageItem].self, forKey: .remoteStorageItems)
        }
    }
}
