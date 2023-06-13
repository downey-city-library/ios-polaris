import Foundation

extension Polaris.Patron {
    
    public enum NameTitle: String, Codable {

        case dr = "Dr."
        case miss = "Miss"
        case mr = "Mr."
        case mrs = "Mrs."
        case ms = "Ms."
        case none = "None"
    }
}
