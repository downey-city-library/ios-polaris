import Foundation

extension Polaris.Item {

    public struct ItemRenewRequest: Encodable {
        
        // MARK: - PROPERTIES
        public let action: String = "renew"
        public let branch: Int
        public let user: Int
        public let workstation: Int
        public let renewData: RenewData
        
        // MARK: - CODING KEYS
        private enum CodingKeys: String, CodingKey {
            case action = "Action"
            case branch = "LogonBranchID"
            case renewData = "RenewData"
            case user = "LogonUserID"
            case workstation = "LogonWorkstationID"
        }
        
        // MARK: - INITIALIZATION
        public init(branch: Int, user: Int, workstation: Int, ignoreErrors: Bool) {
            self.branch = branch
            self.user = user
            self.workstation = workstation
            self.renewData = RenewData(ignoreErrors: ignoreErrors)
        }
    }
}
