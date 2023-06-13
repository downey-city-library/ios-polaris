import Foundation

extension Polaris.Patron.Blocks {
    
    struct CreatePatronBlocksRequest: Encodable {
        
        // MARK: - PROPERTIES
        let type: Int
        let value: String
        
        // MARK: - CODING KEYS
        enum CodingKeys: String, CodingKey {
            case type = "BlockTypeID"
            case value = "BlockValue"
        }
    }
}
