import Foundation

extension Polaris.Bib.BibKeywordSearchResponse {
    
    public struct Bib: Decodable {
        
        // MARK: - PROPERTIES
        public let author: String?
        public let callNumber: String?
        public let controlNumber: Int
        public let courseReserveCount: Int
        public let currentHoldRequests: Int
        public let description: String?
        public let edition: String?
        public let fiction: String?
        public let holdingsNote: String?
        public let holdingsStatement: String?
        public let isbn: String?
        public let kwic: String?
        public let localControlNumber: String?
        public let localItemsIn: Int
        public let localItemsTotal: Int
        public let medium: String?
        public let oclc: String?
        public let position: Int
        public let primaryTypeOfMaterial: Int
        public let publicationDate: String?
        public let publisher: String?
        public let retentionStatement: String?
        public let series: String?
        public let seriesSuggestedQuery: String?
        public let summary: String?
        public let systemItemsIn: Int
        public let systemItemsTotal: Int
        public let targetAudience: String?
        public let thumbnailLink: String?
        public let title: String
        public let typeOfMaterial: String?
        public let upc: String?
        public let vernacularAuthor: String?
        public let vernacularPublisher: String?
        public let vernacularSeries: String?
        public let vernacularTitle: String?
        public let webLink: String?
        
        // MARK: - CODING KEYS
        private enum CodingKeys: String, CodingKey {
            case author = "Author"
            case callNumber = "CallNumber"
            case controlNumber = "ControlNumber"
            case courseReserveCount = "CourseReserveCount"
            case currentHoldRequests = "CurrentHoldRequests"
            case description = "Description"
            case edition = "Edition"
            case fiction = "Fiction"
            case holdingsNote = "HoldingsNote"
            case holdingsStatement = "HoldingsStatement"
            case isbn = "ISBN"
            case kwic = "KWIC"
            case localControlNumber = "LocalControlNumber"
            case localItemsIn = "LocalItemsIn"
            case localItemsTotal = "LocalItemsTotal"
            case medium = "Medium"
            case oclc = "OCLC"
            case position = "Position"
            case primaryTypeOfMaterial = "PrimaryTypeOfMaterial"
            case publicationDate = "PublicationDate"
            case publisher = "Publisher"
            case retentionStatement = "RetentionStatement"
            case series = "Series"
            case seriesSuggestedQuery = "SeriesSuggestedQuery"
            case summary = "Summary"
            case systemItemsIn = "SystemItemsIn"
            case systemItemsTotal = "SystemItemsTotal"
            case targetAudience = "TargetAudience"
            case thumbnailLink = "ThumbnailLink"
            case title = "Title"
            case typeOfMaterial = "TypeOfMaterial"
            case upc = "UPC"
            case vernacularAuthor = "VernacularAuthor"
            case vernacularPublisher = "VernacularPublisher"
            case vernacularSeries = "VernacularSeries"
            case vernacularTitle = "VernacularTitle"
            case webLink = "WebLink"
        }
        
        // MARK: - INITIALIZATION
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            author = try container.decodeIfPresent(String.self, forKey: .author)
            callNumber = try container.decodeIfPresent(String.self, forKey: .callNumber)
            controlNumber = try container.decode(String.self, forKey: .controlNumber).toInt()!
            courseReserveCount = try container.decode(Int.self, forKey: .courseReserveCount)
            currentHoldRequests = try container.decode(Int.self, forKey: .currentHoldRequests)
            description = try container.decodeIfPresent(String.self, forKey: .description)
            edition = try container.decodeIfPresent(String.self, forKey: .edition)
            fiction = try container.decodeIfPresent(String.self, forKey: .fiction)
            holdingsNote = try container.decodeIfPresent(String.self, forKey: .holdingsNote)
            holdingsStatement = try container.decodeIfPresent(String.self, forKey: .holdingsStatement)
            isbn = try container.decodeIfPresent(String.self, forKey: .isbn)
            kwic = try container.decodeIfPresent(String.self, forKey: .kwic)
            localControlNumber = try container.decodeIfPresent(String.self, forKey: .localControlNumber)
            localItemsIn = try container.decode(Int.self, forKey: .localItemsIn)
            localItemsTotal = try container.decode(Int.self, forKey: .localItemsTotal)
            medium = try container.decodeIfPresent(String.self, forKey: .medium)
            oclc = try container.decodeIfPresent(String.self, forKey: .oclc)
            position = try container.decode(Int.self, forKey: .position)
            primaryTypeOfMaterial = try container.decode(Int.self, forKey: .primaryTypeOfMaterial)
            publicationDate = try container.decodeIfPresent(String.self, forKey: .publicationDate)
            publisher = try container.decodeIfPresent(String.self, forKey: .publisher)
            retentionStatement = try container.decodeIfPresent(String.self, forKey: .retentionStatement)
            series = try container.decodeIfPresent(String.self, forKey: .series)
            seriesSuggestedQuery = try container.decodeIfPresent(String.self, forKey: .seriesSuggestedQuery)
            summary = try container.decodeIfPresent(String.self, forKey: .summary)
            systemItemsIn = try container.decode(Int.self, forKey: .systemItemsIn)
            systemItemsTotal = try container.decode(Int.self, forKey: .systemItemsTotal)
            targetAudience = try container.decodeIfPresent(String.self, forKey: .targetAudience)
            thumbnailLink = try container.decodeIfPresent(String.self, forKey: .thumbnailLink)
            title = try container.decode(String.self, forKey: .title)
            typeOfMaterial = try container.decodeIfPresent(String.self, forKey: .typeOfMaterial)
            upc = try container.decodeIfPresent(String.self, forKey: .upc)
            vernacularAuthor = try container.decodeIfPresent(String.self, forKey: .vernacularAuthor)
            vernacularPublisher = try container.decodeIfPresent(String.self, forKey: .vernacularPublisher)
            vernacularSeries = try container.decodeIfPresent(String.self, forKey: .vernacularSeries)
            vernacularTitle = try container.decodeIfPresent(String.self, forKey: .vernacularTitle)
            webLink = try container.decodeIfPresent(String.self, forKey: .webLink)
        }
    }
}
