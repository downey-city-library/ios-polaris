//
//  Polaris+Bib+KeywordSearchResponse+Qualifier.swift
//  Polaris
//
//  Created by Andrew Despres on 4/15/20.
//  Copyright © 2020 Downey City Library. All rights reserved.
//

import Foundation

extension Polaris.Bib.KeywordSearchResponse {
 
    public enum Qualifier: String {
            
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
        
        var string: String { return self.rawValue }
    }
}
