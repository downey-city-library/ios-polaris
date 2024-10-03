import Foundation

extension Polaris.Patron {
    
    public struct PatronItemCheckoutRequest: Encodable {
        
        // MARK: - PROPERTIES
        public var item: String
        public var branch: Int
        public var user: Int
        public var workstation: Int
        
        // MARK: - CODING KEYS
        private enum CodingKeys: String, CodingKey {
            case item = "ItemBarcode"
            case branch = "LogonBranchID"
            case user = "LogonUserID"
            case workstation = "LogonWorkstationID"
        }
        
        // MARK: - INITIALIZATION
        public init(
            item: String,
            branch: Int,
            user: Int,
            workstation: Int
        ) {
            self.item = item
            self.branch = branch
            self.user = user
            self.workstation = workstation
        }
    }
}
