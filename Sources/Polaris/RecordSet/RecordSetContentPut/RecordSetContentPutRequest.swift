import Foundation

extension Polaris.RecordSet {
 
    public struct RecordSetContentPutRequest: Encodable {
        
        // MARK: - PROPERTIES
        public let patrons: String
            
        // MARK: - CODING KEYS
        private enum CodingKeys: String, CodingKey {
            case patrons = "Records"
        }
    }
}
