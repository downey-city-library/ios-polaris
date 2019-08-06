//
//  Item+Codable.swift
//  Polaris
//
//  Created by Andrew Despres on 8/5/19.
//  Copyright © 2019 Downey City Library. All rights reserved.
//

import Foundation

extension Item: Decodable {
    
    // MARK: - Initialization
    public init(from decoder: Decoder) throws {
        let data = try decoder.container(keyedBy: CodingKeys.self)
        
        self.ID = try? data.decode(Int.self, forKey: .ID)
        self.barcode = try data.decode(String.self, forKey: .barcode)
        self.format = try ItemDecoder.parseFormat(from: data)
        self.bib = try ItemDecoder.parseBib(from: data)
        self.callNumber = (try? data.decode(String.self, forKey: .callNumber)) ?? ""
        self.checkoutDate = try ItemDecoder.parseDate(from: data, forKey: .checkoutDate)
        self.dueDate = try ItemDecoder.parseDate(from: data, forKey: .dueDate)
        self.renewal = try ItemDecoder.parseRenewal(from: data)
        self.assignedBranch = try ItemDecoder.parseAssignedBranch(from: data)
        self.loaningBranch = try ItemDecoder.parseLoaningBranch(from: data)
        self.billing = try ItemDecoder.parseBilling(from: data)
        self.isVisibleInPAC = try data.decode(Int.self, forKey: .isVisibleInPAC) == 1 ? true : false
        self.isElectronic = try? data.decode(Bool.self, forKey: .isElectronic)
        self.vendor = try ItemDecoder.parseVendor(from: data)
        self.designation = try? data.decode(String.self, forKey: .designation)
    }
}
