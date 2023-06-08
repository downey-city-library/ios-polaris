import Foundation

extension Polaris.Bib.BibGetResponse {
    
    public struct Authors {
        
        // MARK: - PROPERTIES
        public private(set) var added: [Author] = []
        public private(set) var main: Author?
        
        // MARK: - SETTERS
        mutating func setAdded(to value: String) { added.append(Author(value)) }
        mutating func setMain(to value: String) { main = Author(value) }
    }
}

extension Polaris.Bib.BibGetResponse.Authors {
    
    public struct Author {
        
        // MARK: - PROPERTIES
        public private(set) var birth: String?
        public private(set) var death: String?
        public private(set) var name: Name
        
        // MARK: - INITIALIZATION
        public init(_ author: String?) {
            name = Name()
            
            guard let author = author else { return }
            
            let parts = components(of: author)
            print("parts:", parts)
            
            let commas = parts.count - 1

            switch commas {
            case 0:
                name.setFull(first: parts[0], last: nil)

            case 1:
                if parts[1].contains("-") && parts[1].rangeOfCharacter(from: .decimalDigits) != nil {
                    name.setFirst(to: parts[0])
                    name.setFull(first: parts[0], last: nil)
                    name.setLastFirst(last: nil, first: parts[0])

                    let dates = years(in: parts[1])
                    birth = dates[0].trimmingCharacters(in: .whitespacesAndNewlines)
                    death = dates[1] != "" ? dates[1].trimmingCharacters(in: .whitespacesAndNewlines) : nil
                } else {
                    name.setFirst(to: parts[1])
                    name.setFull(first: parts[1], last: parts[0])
                    name.setLast(to: parts[0])
                    name.setLastFirst(last: parts[0], first: parts[1])
                }

            case 2:
                if parts[2].contains("-") && parts[2].rangeOfCharacter(from: .decimalDigits) != nil {
                    name.setFirst(to: parts[1])
                    name.setFull(first: parts[1], last: parts[0])
                    name.setLastFirst(last: parts[0], first: parts[1])

                    let dates = years(in: parts[2])
                    birth = dates[0].trimmingCharacters(in: .whitespacesAndNewlines)
                    death = dates[1] != "" ? dates[1].trimmingCharacters(in: .whitespacesAndNewlines) : nil
                } else {
                    name.setFirst(to: parts[1])
                    name.setFull(first: parts[1], last: parts[0])
                    name.setLast(to: parts[0])
                    name.setLastFirst(last: parts[0], first: parts[1])
                }

            default: break
            }
        }
        
        // MARK: - PRIVATE METHODS
        private func components(of string: String) -> [String] {
            let components = string.components(separatedBy: ",")
            var cleanedComponents: [String] = []

            for element in components {
                var text = element

                if (text.filter { $0 == "(" }.count) >= 1 {
                    if let index = text.firstIndex(of: "(") {
                        let substring = text[..<index]
                        text = String(substring)
                    }
                }

                text = text.trimmingCharacters(in: .whitespacesAndNewlines)

                if (text.filter { $0 == "." }.count) < 2 {
                    text = text.trimmingCharacters(in: ["."])
                }
                if text != "author" && text != "composer" && text != "performer" {
                    cleanedComponents.append(text)
                }
            }

            return cleanedComponents
        }
        
        private func years(in string: String) -> [String] {
            let components = string.components(separatedBy: "-")
            return components
        }
    }
}

extension Polaris.Bib.BibGetResponse.Authors.Author {
    
    public struct Name {
        
        // MARK: - PROPERTIES
        public private(set) var first: String?
        public private(set) var full: String?
        public private(set) var last: String?
        public private(set) var lastFirst: String?
        
        // MARK: - SETTERS
        mutating func setFirst(to value: String) {
            first = trim(value)
        }
        
        mutating func setFull(first: String, last: String?) {
            let first = trim(first)
            if var last = last {
                last = trim(last)
                full = "\(first) \(last)"
            } else { full = first }
        }
        
        mutating func setLast(to value: String) {
            last = trim(value)
        }
        
        mutating func setLastFirst(last: String?, first: String) {
            let first = trim(first)
            if var last = last {
                last = trim(last)
                lastFirst = "\(last), \(first)"
            } else { lastFirst = first }
        }
        
        // MARK: - PRIVATE METHODS
        private func trim(_ string: String) -> String {
            return string.trimmingCharacters(in: .whitespacesAndNewlines).trimmingCharacters(in: .punctuationCharacters)
        }
    }
}
