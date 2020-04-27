//
//  Polaris+Bib+GetResponse.swift
//  Polaris
//
//  Created by Andrew Despres on 4/26/20.
//  Copyright © 2020 Downey City Library. All rights reserved.
//

import Foundation

extension Polaris.Bib {
    
    public struct GetResponse: Decodable {
        
        // MARK: - Properties
        public private(set) var error: PolarisError?
        
        public private(set) var publisher: Publisher
        public private(set) var description: String?
        public private(set) var edition: String?
        public private(set) var ISBNs: [String] = []
        public private(set) var items: Items
        public private(set) var currentHolds: Int?
        public private(set) var summary: String?
        public private(set) var controlNumber: Int?
        public private(set) var callNumber: String?
        public private(set) var format: String?
        public private(set) var authors: Authors
        public private(set) var series: String?
        public private(set) var subjects: [String] = []
        public private(set) var LCCN: String?
        public private(set) var ISSN: String?
        public private(set) var otherNumber: String?
        public private(set) var genres: [String] = []
        public private(set) var notes: [String] = []
        public private(set) var contents: String?
        public private(set) var webLink: String?
        public private(set) var titles: Titles
        public private(set) var volume: String?
        public private(set) var frequency: String?
        public private(set) var STRN: String?
        public private(set) var GPOItemNumber: String?
        public private(set) var CODEN: String?
        public private(set) var targetAudience: String?
        public private(set) var medium: String?
        
        // MARK: - Coding Keys
        private enum CodingKeys: String, CodingKey {
            
            case rows = "BibGetRows"
            case errorCode = "PAPIErrorCode"
        }
        
        // MARK: - Initialization
        public init(from decoder: Decoder) throws {
            let data = try decoder.container(keyedBy: CodingKeys.self)
            let errorCode = try data.decode(Int.self, forKey: .errorCode)
            
            error = errorCode == 0 ? nil : PolarisError(rawValue: errorCode)
            
            authors = Authors()
            items = Items()
            publisher = Publisher()
            titles = Titles()
            
            if let rows = try? data.decode([Row].self, forKey: .rows) {
                for row in rows {
                    switch row.elementID {
                    case 2: publisher.setName(to: row.value)
                    case 3: description = row.value
                    case 5: edition = row.value
                    case 6: ISBNs.append(row.value.filter("0123456789X".contains))
                    case 7: items.system.setTotal(to: row.value)
                    case 8: currentHolds = Int(row.value)
                    case 9: summary = row.value
                    case 10: items.local.setTotal(to: row.value)
                    case 11: controlNumber = Int(row.value)
                    case 13: callNumber = row.value
                    case 15: items.local.setAvailable(to: row.value)
                    case 16: items.system.setAvailable(to: row.value)
                    case 17: format = row.value
                    case 18: authors.setMain(to: row.value)
                    case 19: series = row.value
                    case 20: subjects.append(row.value)
                    case 21: authors.setAdded(to: row.value)
                    case 22: titles.setAdded(to: row.value)
                    case 23: LCCN = row.value.filter("0123456789".contains)
                    case 24: ISSN = row.value
                    case 25: otherNumber = row.value
                    case 27: genres.append(row.value)
                    case 28: notes.append(row.value)
                    case 29: contents = row.value
                    case 30: publisher.setNumber(to: row.value)
                    case 33: webLink = row.value
                    case 34: titles.setUniform(to: row.value)
                    case 35: titles.setMain(to: row.value)
                    case 36: volume = row.value
                    case 37: frequency = row.value
                    case 39: titles.setFormer(to: row.value)
                    case 40: titles.setLater(to: row.value)
                    case 41: STRN = row.value
                    case 42: GPOItemNumber = row.value
                    case 43: CODEN = row.value
                    case 44: targetAudience = row.value
                    case 46: medium = row.value
                        
                    default: break
                    }
                }
            }
        }
    }
}
