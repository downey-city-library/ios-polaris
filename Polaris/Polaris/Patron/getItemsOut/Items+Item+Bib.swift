//
//  Items+Item+Bib.swift
//  Polaris
//
//  Created by Andrew Despres on 8/6/19.
//  Copyright © 2019 Downey City Library. All rights reserved.
//

import Foundation

extension Items.Item {
    public struct Bib {
        // MARK: - Private Properties (Get/Set)
        internal var _author: String?
        internal var _ID: Int?
        internal var _ISBN: String?
        internal var _ISSN: String?
        internal var _OCLC: String?
        internal var _title: String
        internal var _UPC: String?
        internal var _volumeNumber: String?
        
        // MARK: - Public Properties (Get Only)
        public var author: String? { get { return _author } }
        public var ID: Int? { get { return _ID } }
        public var ISBN: String? { get { return _ISBN } }
        public var ISSN: String? { get { return _ISSN } }
        public var OCLC: String? { get { return _OCLC } }
        public var title: String { get { return _title } }
        public var UPC: String? { get { return _UPC } }
        public var volumeNumber: String? { get { return _volumeNumber } }
    }
}


