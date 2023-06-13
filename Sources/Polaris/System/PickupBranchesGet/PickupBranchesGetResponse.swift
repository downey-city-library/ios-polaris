import Foundation

extension Polaris.System {
    
    public struct PickupBranchesGetResponse: Decodable, PolarisResponse {
        
        // MARK: - PROPERTIES
        public let error: PolarisError?
        public let pickupBranches: [PickupBranch]

        // MARK: - CODING KEYS
        enum CodingKeys: String, CodingKey {
            case errorCode = "PAPIErrorCode"
            case pickupBranches = "PickupBranchesRows"
        }

        // MARK: - INITIALIZATION
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            let errorCode = try container.decode(Int.self, forKey: .errorCode)
            
            error = errorCode == 0 ? nil : PolarisError(rawValue: errorCode)
            pickupBranches = try container.decode([PickupBranch].self, forKey: .pickupBranches)
        }
    }
}
