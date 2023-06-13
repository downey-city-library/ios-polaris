import Foundation

extension Polaris.System {
    
    public struct NotificationUpdateRequest: Encodable {
        
        // MARK: - PROPERTIES
        public let logonBranchID: Int
        public let logonUserID: Int
        public let logonWorkstationID: Int
        public let organization: Int?
        public let notificationStatusID: Int
        public let notificationDeliveryDate: Date
        public let deliveryOptionID: Int
        public let deliveryString: String
        public let details: String?
        public let patronID: Int
        public let language: Int?
        public let itemRecordID: Int
        
        // MARK: - CODING KEYS
        private enum CodingKeys: String, CodingKey {
            case logonBranchID = "LogonBranchID"
            case logonUserID = "LogonUserID"
            case logonWorkstationID = "LogonWorkstationID"
            case organization = "ReportingOrgID"
            case notificationStatusID = "NotificationStatusID"
            case notificationDeliveryDate = "NotificationDeliveryDate"
            case deliveryOptionID = "DeliveryOptionID"
            case deliveryString = "DeliveryString"
            case details = "Details"
            case patronID = "PatronID"
            case language = "PatronLanguageID"
            case itemRecordID = "ItemRecordID"
        }
    }
}
