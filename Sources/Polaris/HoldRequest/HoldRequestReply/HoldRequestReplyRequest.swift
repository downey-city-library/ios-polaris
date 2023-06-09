import Foundation

extension Polaris.HoldRequest {
    
    public struct HoldRequestReplyRequest: Encodable {
        
        // MARK: - PROPERTIES
        public let groupQualifier: String
        public let transactionQualifier: String
        public let organization: Int
        public let answer: Int
        public let state: Int
        
        // MARK: - CODING KEYS
        private enum CodingKeys: String, CodingKey {
            case groupQualifier = "TxnGroupQualifier"
            case transactionQualifier = "TxnQualifier"
            case organization = "RequestingOrgID"
            case answer = "Answer"
            case state = "State"
        }
        
        // MARK: - INITIALIZATION
        public init(groupQualifier: String, transactionQualifier: String, organization: Int, answer: Answer, state: State) {
            self.groupQualifier = groupQualifier
            self.transactionQualifier = transactionQualifier
            self.organization = organization
            self.answer = answer.int
            self.state = state.int
        }
    }
}
