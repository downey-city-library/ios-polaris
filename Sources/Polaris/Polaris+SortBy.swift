import Foundation

extension Polaris {
 
    public enum SortBy: String, CaseIterable, Identifiable {
        case author = "AU"
        case authorPublication = "AUPD"
        case authorTitle = "AUTI"
        case callNumber = "CALL"
        case callNumberAuthor = "CALLAU"
        case callNumberPublication = "CALLPD"
        case callNumberTitle = "CALLTI"
        case mostPopular = "MP"
        case publication = "PD/sort.descending"
        case publicationAuthor = "PDAU"
        case publicationTitle = "PDTI"
        case relevance = "RELEVANCE"
        case title = "TI"
        case titleAuthor = "TIAU"
        case titleMaterial = "TITOM"
        case titlePublication = "TIPD"
        
        public var id: String { self.rawValue }
        
        public var string: String { self.rawValue }
        
        public var description: String {
            switch self {
            case .author:
                return "author"
            case .authorPublication:
                return "author, then publication (date descending)"
            case .authorTitle:
                return "author, then title"
            case .callNumber:
                return "call number"
            case .callNumberAuthor:
                return "call number, then author"
            case .callNumberPublication:
                return "call number, then publication (date descending)"
            case .callNumberTitle:
                return "call number, then title"
            case .mostPopular:
                return "most popular (date descending)"
            case .publication:
                return "publication (date descending)"
            case .publicationAuthor:
                return "publication (date descending), then author"
            case .publicationTitle:
                return "publication (date descending), then title"
            case .relevance:
                return "relevance"
            case .title:
                return "title"
            case .titleAuthor:
                return "title, then author"
            case .titleMaterial:
                return "title, then type of material"
            case .titlePublication:
                return "title, then publication (date descending)"
            }
        }
    }
}
