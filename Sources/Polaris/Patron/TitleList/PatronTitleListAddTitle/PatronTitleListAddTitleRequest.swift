import Foundation

extension Polaris.Patron.TitleList {
    
    public struct PatronTitleListAddTitleRequest: Encodable {
        
        // MARK: - PROPERTIES
        public let id: Int
        public let name: String?
        public let controlNumber: Int
        
        // MARK: - CODING KEYS
        private enum CodingKeys: String, CodingKey {
            case id = "RecordStoreID"
            case name = "RecordName"
            case controlNumber = "LocalControlNumber"
        }
    }
}
