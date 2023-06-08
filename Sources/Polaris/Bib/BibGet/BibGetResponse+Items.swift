import Foundation

extension Polaris.Bib.BibGetResponse {
    
    public struct Items {
        
        // MARK: - PROPERTIES
        public var local = Counts()
        public var system = Counts()
    }
}

extension Polaris.Bib.BibGetResponse.Items {
    
    public struct Counts {
        
        // MARK: - PROPERTIES
        public private(set) var available: Int?
        public private(set) var total: Int?
        
        // MARK: - SETTERS
        mutating func setAvailable(to value: String) {
            available = Int(value)
        }
        
        mutating func setTotal(to value: String) {
            total = Int(value)
        }
    }
}
