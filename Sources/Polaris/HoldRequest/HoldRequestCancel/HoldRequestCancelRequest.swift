import Foundation

extension Polaris.HoldRequest {

    public struct HoldRequestCancelRequest: Encodable {
        
        // MARK: - PROPERTIES
        public let workstation: Int
        public let user: Int
        
        // MARK: - CODING KEYS
        private enum CodingKeys: String, CodingKey {
            case workstation = "wsid"
            case user = "userid"
        }
        
        // MARK: - INITIALIZATION
        public init(user: Int, workstation: Int) {
            self.workstation = workstation
            self.user = user
        }
    }
}
