import Foundation

extension Polaris.Bib.BibBooleanSearchResponse {
    
    public struct Bib: Decodable {
        
        // MARK: - PROPERTIES
        public private(set) var author: String?
        public private(set) var callNumber: String?
        public private(set) var controlNumber: String
        public private(set) var courseReserveCount: Int
        public private(set) var currentHoldRequests: Int
        public private(set) var description: String?
        public private(set) var edition: String?
        public private(set) var fiction: String?
        public private(set) var holdingsNote: String?
        public private(set) var holdingsStatement: String?
        public private(set) var isbn: String?
        public private(set) var kwic: String?
        public private(set) var localControlNumber: String?
        public private(set) var localItemsIn: Int
        public private(set) var localItemsTotal: Int
        public private(set) var medium: String?
        public private(set) var oclc: String?
        public private(set) var position: Int
        public private(set) var primaryTypeOfMaterial: Int
        public private(set) var publicationDate: String?
        public private(set) var publisher: String?
        public private(set) var retentionStatement: String?
        public private(set) var series: String?
        public private(set) var seriesSuggestedQuery: String?
        public private(set) var summary: String?
        public private(set) var systemItemsIn: Int
        public private(set) var systemItemsTotal: Int
        public private(set) var targetAudience: String?
        public private(set) var thumbnailLink: String?
        public private(set) var title: String
        public private(set) var typeOfMaterial: String?
        public private(set) var upc: String?
        public private(set) var vernacularAuthor: String?
        public private(set) var vernacularPublisher: String?
        public private(set) var vernacularSeries: String?
        public private(set) var vernacularTitle: String?
        public private(set) var webLink: String?
        
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
        
        // MARK: - INTIALIZATION
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            author = try container.decodeIfPresent(String.self, forKey: .author)
            callNumber = try container.decodeIfPresent(String.self, forKey: .callNumber)
            controlNumber = try container.decode(String.self, forKey: .controlNumber)
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
