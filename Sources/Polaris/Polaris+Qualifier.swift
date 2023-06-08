import Foundation

extension Polaris {
 
    public enum Qualifier: String, CaseIterable, Identifiable {
        case author = "AU"
        case barcode = "BC"
        case coden = "CODEN"
        case controlNumber = "CN"
        case dewey = "DD"
        case genre = "GENRE"
        case isbn = "ISBN"
        case issn = "ISSN"
        case keyword = "KW"
        case lc = "LC"
        case lccn = "LCCN"
        case local = "LOCAL"
        case note = "NOTE"
        case publisher = "PUB"
        case publisherNumber = "PN"
        case series = "SE"
        case strn = "STRN"
        case subject = "SU"
        case sudoc = "SUDOC"
        case title = "TI"
        
        public var id: String { self.rawValue }
        
        public var string: String { self.rawValue }
        
        public var description: String {
            switch self {
            case .author:
                return "author"
            case .barcode:
                return "barcode"
            case .coden:
                return "coden"
            case .controlNumber:
                return "control number"
            case .dewey:
                return "dewey"
            case .genre:
                return "genre"
            case .isbn:
                return "ISBN"
            case .issn:
                return "ISSN"
            case .keyword:
                return "keyword"
            case .lc:
                return "library of congress"
            case .lccn:
                return "LCCN"
            case .local:
                return "local"
            case .note:
                return "note"
            case .publisher:
                return "publisher"
            case .publisherNumber:
                return "publisher number"
            case .series:
                return "series"
            case .strn:
                return "strn"
            case .subject:
                return "subject"
            case .sudoc:
                return "SUDOC number"
            case .title:
                return "title"
            }
        }
    }
}
