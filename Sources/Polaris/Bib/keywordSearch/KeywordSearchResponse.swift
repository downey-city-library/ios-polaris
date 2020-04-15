//
//  KeywordSearchResponse.swift
//  Polaris
//
//  Created by Andrew Despres on 4/15/20.
//  Copyright © 2020 Downey City Library. All rights reserved.
//

import Foundation
    
public struct KeywordSearchResponse: Decodable {
    
    // MARK: - Properties
    public private(set) var error: PolarisError?
    public private(set) var bibs: [Bib]
    public private(set) var count: Int
    public private(set) var query: String
    
    
    // MARK: - Coding Keys
    private enum CodingKeys: String, CodingKey {
        
        case errorCode = "PAPIErrorCode"
        case bibs = "BibSearchRows"
        case count = "TotalRecordsFound"
        case query = "WordList"
    }
    
    // MARK: - Initialization
    public init(from decoder: Decoder) throws {
        let data = try decoder.container(keyedBy: CodingKeys.self)
        let errorCode = try data.decode(Int.self, forKey: .errorCode)
        
        error = errorCode == 0 ? nil : PolarisError(rawValue: errorCode)
        bibs = (try? data.decode([Bib].self, forKey: .bibs)) ?? []
        count = try data.decode(Int.self, forKey: .count)
        query = try data.decode(String.self, forKey: .query)
    }
}

extension KeywordSearchResponse {
    
    public struct Bib: Decodable {
        
        // MARK: - Properties
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
        
        // MARK: - Coding Keys
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
        
        // MARK: - Initialization
        public init(from decoder: Decoder) throws {
            let data = try decoder.container(keyedBy: CodingKeys.self)
            
            author = try? data.decode(String.self, forKey: .author)
            callNumber = try? data.decode(String.self, forKey: .callNumber)
            controlNumber = try data.decode(String.self, forKey: .controlNumber)
            courseReserveCount = try data.decode(Int.self, forKey: .courseReserveCount)
            currentHoldRequests = try data.decode(Int.self, forKey: .currentHoldRequests)
            description = try? data.decode(String.self, forKey: .description)
            edition = try? data.decode(String.self, forKey: .edition)
            fiction = try? data.decode(String.self, forKey: .fiction)
            holdingsNote = try? data.decode(String.self, forKey: .holdingsNote)
            holdingsStatement = try? data.decode(String.self, forKey: .holdingsStatement)
            isbn = try? data.decode(String.self, forKey: .isbn)
            kwic = try? data.decode(String.self, forKey: .kwic)
            localControlNumber = try? data.decode(String.self, forKey: .localControlNumber)
            localItemsIn = try data.decode(Int.self, forKey: .localItemsIn)
            localItemsTotal = try data.decode(Int.self, forKey: .localItemsTotal)
            medium = try? data.decode(String.self, forKey: .medium)
            oclc = try? data.decode(String.self, forKey: .oclc)
            position = try data.decode(Int.self, forKey: .position)
            primaryTypeOfMaterial = try data.decode(Int.self, forKey: .primaryTypeOfMaterial)
            publicationDate = try? data.decode(String.self, forKey: .publicationDate)
            publisher = try? data.decode(String.self, forKey: .publisher)
            retentionStatement = try? data.decode(String.self, forKey: .retentionStatement)
            series = try? data.decode(String.self, forKey: .series)
            seriesSuggestedQuery = try? data.decode(String.self, forKey: .seriesSuggestedQuery)
            summary = try? data.decode(String.self, forKey: .summary)
            systemItemsIn = try data.decode(Int.self, forKey: .systemItemsIn)
            systemItemsTotal = try data.decode(Int.self, forKey: .systemItemsTotal)
            targetAudience = try? data.decode(String.self, forKey: .targetAudience)
            thumbnailLink = try? data.decode(String.self, forKey: .thumbnailLink)
            title = try data.decode(String.self, forKey: .title)
            typeOfMaterial = try? data.decode(String.self, forKey: .typeOfMaterial)
            upc = try? data.decode(String.self, forKey: .upc)
            vernacularAuthor = try? data.decode(String.self, forKey: .vernacularAuthor)
            vernacularPublisher = try? data.decode(String.self, forKey: .vernacularPublisher)
            vernacularSeries = try? data.decode(String.self, forKey: .vernacularSeries)
            vernacularTitle = try? data.decode(String.self, forKey: .vernacularTitle)
            webLink = try? data.decode(String.self, forKey: .webLink)
        }
    }
}
