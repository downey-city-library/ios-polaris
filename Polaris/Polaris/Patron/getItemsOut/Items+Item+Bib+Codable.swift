//
//  Items+Item+Bib+Codable.swift
//  Polaris
//
//  Created by Andrew Despres on 8/27/19.
//  Copyright © 2019 Downey City Library. All rights reserved.
//

import Foundation

extension Items.Item.Bib {
    // MARK: - Coding Keys
    public enum CodingKeys: String, CodingKey {
        case author = "Author"
        case ID = "BibID"
        case ISBN = "ISBN"
        case ISSN = "ISSN"
        case OCLC = "OCLCNumber"
        case title = "Title"
        case UPC = "UPCNumber"
        case volumeNumber = "VolumeNumber"
    }
}

extension Items.Item.Bib: Decodable {
    // MARK: Initialization
    public init(from decoder: Decoder) throws {
        let data = try decoder.container(keyedBy: CodingKeys.self)
        
        self._author = try? data.decode(String.self, forKey: .author)
        self._ID = try? data.decode(Int.self, forKey: .ID)
        self._ISBN = try? data.decode(String.self, forKey: .ISBN)
        self._ISSN = try? data.decode(String.self, forKey: .ISSN)
        self._OCLC = try? data.decode(String.self, forKey: .OCLC)
        self._title = try data.decode(String.self, forKey: .title)
        self._UPC = try? data.decode(String.self, forKey: .UPC)
        self._volumeNumber = try? data.decode(String.self, forKey: .volumeNumber)
    }
    
    public init(ID: Int?, title: String, author: String?, ISBN: String?, ISSN: String?, OCLC: String?, UPC: String?, volumeNumber: String?) {
        self._author = author
        self._ID = ID
        self._ISBN = ISBN
        self._ISSN = ISSN
        self._OCLC = OCLC
        self._title = title
        self._UPC = UPC
        self._volumeNumber = volumeNumber
    }
}
