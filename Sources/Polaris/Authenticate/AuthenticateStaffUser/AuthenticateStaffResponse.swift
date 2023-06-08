import Foundation

extension Polaris.Authenticate {

    public struct AuthenticateStaffResponse: Decodable, PolarisResponse {
        
        // MARK: - PROPERTIES
        public let error: PolarisError?
        public let access: Access?
        public let branch: Int
        public let id: Int
        public let workstation = PolarisConfiguration.shared.staffUser.workstation
        
        // MARK: - CODING KEYS
        private enum CodingKeys: String, CodingKey {
            case errorCode = "PAPIErrorCode"
            case branchID = "BranchID"
            case polarisUserID = "PolarisUserID"
        }
        
        // MARK: - INITIALIZATION
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            let errorCode = try container.decode(Int.self, forKey: .errorCode)
            
            error = errorCode == 0 ? nil : PolarisError(rawValue: errorCode)
            access = errorCode == 0 ? try Access(from: decoder) : nil
            branch = try container.decode(Int.self, forKey: .branchID)
            id = try container.decode(Int.self, forKey: .polarisUserID)
        }
    }
}
