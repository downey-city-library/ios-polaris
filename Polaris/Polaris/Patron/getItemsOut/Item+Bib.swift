//
//  Item+Bib.swift
//  Polaris
//
//  Created by Andrew Despres on 8/6/19.
//  Copyright © 2019 Downey City Library. All rights reserved.
//

import Foundation

extension Item {
    public struct Bib {
        
        // MARK: - Public Properties
        public let ID: Int?
        public let title: String
        public let author: String?
        public let ISBN: String?
        public let ISSN: String?
        public let OCLC: String?
        public let UPC: String?
        public let volumeNumber: String?
    }
}
