import Foundation

extension Polaris.Bib.BibGetResponse {
    
    public struct Titles {
        
        // MARK: - PROPERTIES
        public private(set) var added: [String] = []
        public private(set) var uniform: String?
        public private(set) var main: String?
        public private(set) var former: String?
        public private(set) var later: String?
        
        // MARK: - SETTERS
        mutating func setAdded(to value: String) {
            added.append(value)
        }
        
        mutating func setUniform(to value: String) {
            uniform = value
        }
        
        mutating func setMain(to value: String) {
            main = value
        }
        
        mutating func setFormer(to value: String) {
            former = value
        }
        
        mutating func setLater(to value: String) {
            later = value
        }
    }
}
