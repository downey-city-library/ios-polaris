import Foundation

extension RawRepresentable where RawValue: Decodable {
    
    init(from decoder: Decoder, default: Self) throws {
        let container = try decoder.singleValueContainer()
        let rawValue = try container.decode(RawValue.self)
        self = Self(rawValue: rawValue) ?? `default`
    }
}
