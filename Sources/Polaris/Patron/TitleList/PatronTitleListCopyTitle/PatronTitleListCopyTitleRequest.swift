import Foundation

extension Polaris.Patron.TitleList {
    
    public struct PatronTitleListCopyTitleRequest: Encodable {
        
        // MARK: - PROPERTIES
        public let fromTitleList: Int
        public let fromPosition: Int
        public let toTitleList: Int
        
        // MARK: - CODING KEYS
        private enum CodingKeys: String, CodingKey {
            case fromTitleList = "FromRecordStoreID"
            case fromPosition = "FromPosition"
            case toTitleList = "ToRecordStoreID"
        }
    }
}
