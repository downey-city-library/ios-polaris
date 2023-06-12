import Foundation

extension Polaris.Patron.Account {
    
    public struct PatronAccountCreateCreditRequest: Encodable {
        
        // MARK: - PROPERTIES
        public var amount: Double
        public var paymentMethodID: Int
        public var note: String
        
        // MARK: - CODING KEYS
        private enum CodingKeys: String, CodingKey {
            case amount = "TxnAmount"
            case paymentMethodID = "PaymentMethodID"
            case note = "FreeTextNote"
        }
    }
}
