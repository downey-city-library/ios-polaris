//
//  Polaris+Bib+BooleanSearchResponse+SortBy.swift
//  Polaris
//
//  Created by Andrew Despres on 4/27/20.
//  Copyright © 2020 Downey City Library. All rights reserved.
//

import Foundation

extension Polaris.Bib.BooleanSearchResponse {
 
    public enum SortBy: String {
            
        case author = "AU"
        case authorPublication = "AUPD"
        case authorTitle = "AUTI"
        case callNumber = "CALL"
        case callNumberAuthor = "CALLAU"
        case callNumberPublication = "CALLPD"
        case callNumberTitle = "CALLTI"
        case mostPopular = "MP/sort.descending"
        case publication = "PD/sort.descending"
        case publicationAuthor = "PDAU"
        case publicationTitle = "PDTI"
        case relevance = "RELEVANCE"
        case title = "TI"
        case titleAuthor = "TIAU"
        case titleMaterial = "TITOM"
        case titlePublication = "TIPD"
        
        var string: String { return self.rawValue }
    }
}
