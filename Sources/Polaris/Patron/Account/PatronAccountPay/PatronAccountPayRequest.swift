import Foundation

extension Polaris.Patron.Account {
    
    public struct PatronAccountPayRequest: Encodable {
        
        // MARK: - PROPERTIES
        public var amount: Double
        public var paymentMethod: Int
        public var note: String
        
        // MARK: - CODING KEYS
        private enum CodingKeys: String, CodingKey {
            case amount = "TxnAmount"
            case paymentMethod = "PaymentMethodID"
            case note = "FreeTextNote"
        }
    }
}
