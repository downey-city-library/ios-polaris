import Foundation

extension Polaris.Bib.BibGetResponse {
    
    public struct Publisher {
        
        // MARK: - PROPERTIES
        public private(set) var location: String? = nil
        public private(set) var name: String? = nil
        public private(set) var number: Int? = nil
        public private(set) var year: String? = nil
        
        // MARK: - SETTERS
        mutating func setName(to value: String) {
            location = location(of: value)
            name = name(of: value)
            year = year(of: value)
        }

        mutating func setNumber(to value: String) {
            number = Int(value)
        }
        
        // MARK: - PRIVATE METHODS
        private func location(of publisher: String) -> String? {
            let components = publisher.components(separatedBy: ":")
            if components.count > 1 { return components[0].trimmingCharacters(in: .whitespacesAndNewlines) }

            return nil
        }
        
        private func name(of publisher: String) -> String? {
            let componentSet1 = publisher.components(separatedBy: ":")
            if componentSet1.count > 1 {
                let componentSet2 = componentSet1[1].components(separatedBy: ",")
                if componentSet2.count > 1 {
                    return componentSet2[0].trimmingCharacters(in: .whitespacesAndNewlines)
                }
            }

            return nil
        }
        
        private func year(of publisher: String) -> String? {
            let components = publisher.components(separatedBy: ",")
            if components.count > 1 {
                return components.last?.trimmingCharacters(in: .whitespacesAndNewlines).trimmingCharacters(in: ["c", "."])
            }

            return nil
        }
    }
}
