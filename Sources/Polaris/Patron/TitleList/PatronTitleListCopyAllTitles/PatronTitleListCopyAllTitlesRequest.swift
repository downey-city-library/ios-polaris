import Foundation

extension Polaris.Patron.TitleList {
    
    public struct PatronTitleListCopyAllTitlesRequest: Encodable {
        
        // MARK: - PROPERTIES
        public let fromTitleList: Int
        public let toTitleList: Int
        
        // MARK: - CODING KEYS
        private enum CodingKeys: String, CodingKey {
            case fromTitleList = "FromRecordStoreID"
            case toTitleList = "ToRecordStoreID"
        }
    }
}
