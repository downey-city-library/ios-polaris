import Foundation

extension Polaris.Patron.TitleList.PatronTitleListGetTitlesResponse {
    
    public struct Title: Decodable {
        
        // MARK: - PROPERTIES
        public let position: Int
        public let id: Int
        public let name: String
        public let controlNumber: Int

        // MARK: - CODING KEYS
        private enum CodingKeys: String, CodingKey {
            case position = "Position"
            case id = "RecordID"
            case name = "Name"
            case controlNumber = "LocalControlNumber"
        }

        // MARK: - INITIALIZATION
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            position = try container.decode(Int.self, forKey: .position)
            id = try container.decode(Int.self, forKey: .id)
            name = try container.decode(String.self, forKey: .name)
            controlNumber = try container.decode(Int.self, forKey: .controlNumber)
        }
    }
}
