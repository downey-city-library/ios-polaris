import Foundation

extension Polaris.Item.ItemRenewRequest {

    public struct RenewData: Encodable {
    
        // MARK: - PROPERTIES
        public let ignoreErrors: Bool
    
        // MARK: - CODING KEYS
        private enum CodingKeys: String, CodingKey {
            case ignoreErrors = "IgnoreOverrideErrors"
        }
    
        // MARK: - INITIALIZATION
        public init(ignoreErrors: Bool) {
            self.ignoreErrors = ignoreErrors
        }
    }
}
