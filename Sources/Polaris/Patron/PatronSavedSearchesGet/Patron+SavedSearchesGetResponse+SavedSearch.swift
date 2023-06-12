import Foundation

extension Polaris.Patron.PatronSavedSearchesGetResponse {
    
    public struct SavedSearch: Decodable {
        
        // MARK: - PROPERTIES
        public let id: Int
        public let name: String
        public let criteria: String
        public let period: String
        public let lastRunDate: String
        public let notifyOnNoResults: Bool
        public let emailResultsTo: String
        public let resultsCount: Int
        
        // MARK: - CODING KEYS
        private enum CodingKeys: String, CodingKey {
            case id = "SDISearchID"
            case name = "SDIName"
            case criteria = "SearchCriteria"
            case period = "SearchPeriod"
            case lastRunDate = "LastRunDate"
            case notifyOnNoResults = "NotifyOnNoResults"
            case emailResultsTo = "EmailResultsTo"
            case resultsCount = "ResultsCount"
        }
        
        // MARK: - INITIALIZATION
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            id = try container.decode(Int.self, forKey: .id)
            name = try container.decode(String.self, forKey: .name)
            criteria = try container.decode(String.self, forKey: .criteria)
            period = try container.decode(String.self, forKey: .period)
            lastRunDate = try container.decode(String.self, forKey: .lastRunDate)
            notifyOnNoResults = try container.decode(Bool.self, forKey: .notifyOnNoResults)
            emailResultsTo = try container.decode(String.self, forKey: .emailResultsTo)
            resultsCount = try container.decode(Int.self, forKey: .resultsCount)
        }
    }
}
