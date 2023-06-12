import Foundation

extension Polaris.Patron.Account {
    
    public struct PatronAccountRefundCreditRequest: Encodable {
        
        // MARK: - PROPERTIES
        public var amount: Double
        public var note: String
        
        // MARK: - CODING KEYS
        private enum CodingKeys: String, CodingKey {
            case amount = "TxnAmount"
            case note = "FreeTextNote"
        }
    }
}
