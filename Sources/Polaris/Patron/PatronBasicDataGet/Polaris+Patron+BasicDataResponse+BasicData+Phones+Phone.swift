import Foundation

extension Polaris.Patron.BasicDataResponse.BasicData {
    
    public struct Phone {
        
        // MARK: - PROPERTIES
        public let carrier: Int?
        public let number: String?
        
        // MARK: - INITIALIZATION
        internal init(number: String?, carrier: Int?) {
            self.carrier = carrier
            self.number = number
        }
    }
}
