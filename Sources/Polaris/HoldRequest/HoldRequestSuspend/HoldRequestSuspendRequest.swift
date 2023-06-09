import Foundation

extension Polaris.HoldRequest {

    public struct HoldRequestSuspendRequest: Encodable {
        
        // MARK: - PROPERTIES
        public let user: Int
        public let activationDate: String
        
        // MARK: - CODING KEYS
        private enum CodingKeys: String, CodingKey {
            case activationDate = "ActivationDate"
            case user = "UserID"
        }
        
        // MARK: - INITIALIZATION
        public init(user: Int, activationDate: Date) {
            self.user = user
            self.activationDate = activationDate.ISO8601Format()
        }
    }
}
