import Foundation

extension Polaris.Patron.Account {
    
    public struct PatronAccountCreateTitleListRequest: Encodable {
        
        // MARK: - PROPERTIES
        public var name: String
        
        // MARK: - CODING KEYS
        private enum CodingKeys: String, CodingKey {
            case name = "RecordStoreName"
        }
    }
}
