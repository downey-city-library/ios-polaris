import Foundation

extension Polaris.Item {
    
    public struct ItemUpdateBarcodeRequest: Encodable {
        
        // MARK: - PROPERTIES
        public let branch: Int
        public let barcode: String
        
        // MARK: - CODING KEYS
        private enum CodingKeys: String, CodingKey {
            case branch = "TransactionBranchID"
            case barcode = "ItemBarcode"
        }
        
        // MARK: - INITIALIZATION
        public init(branch: Int, barcode: String) {
            self.branch = branch
            self.barcode = barcode
        }
    }
}
