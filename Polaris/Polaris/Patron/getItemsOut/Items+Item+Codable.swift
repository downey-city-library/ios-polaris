//
//  Items+Item+Codable.swift
//  Polaris
//
//  Created by Andrew Despres on 8/5/19.
//  Copyright © 2019 Downey City Library. All rights reserved.
//

import Foundation

extension Items.Item {
    // MARK: - Coding Keys
    enum CodingKeys: String, CodingKey {
        case barcode = "Barcode"
        case callNumber = "CallNumber"
        case checkoutDate = "CheckOutDate"
        case designation = "Designation"
        case dueDate = "DueDate"
        case ID = "ItemID"
        case isElectronic = "ElectronicItem"
        case isVisibleInPAC = "DisplayInPAC"
    }
}

extension Items.Item: Decodable {
    // MARK: - Initialization
    public init(from decoder: Decoder) throws {
        let data = try decoder.container(keyedBy: CodingKeys.self)
        
        self._assignedBranch = try? Branch(from: decoder, forType: .assigned)
        self._barcode = try data.decode(String.self, forKey: .barcode)
        self._bib = try Bib(from: decoder)
        self._billing = try? Billing(from: decoder)
        self._callNumber = (try? data.decode(String.self, forKey: .callNumber)) ?? ""
        self._checkoutDate = (try data.decode(String.self, forKey: .checkoutDate)).toDate()
        self._designation = try? data.decode(String.self, forKey: .designation)
        self._dueDate = (try data.decode(String.self, forKey: .dueDate)).toDate()
        self._format = try? Format(from: decoder)
        self._ID = try? data.decode(Int.self, forKey: .ID)
        self._isElectronic = try? data.decode(Bool.self, forKey: .isElectronic)
        self._isVisibleInPAC = try data.decode(Int.self, forKey: .isVisibleInPAC) == 1 ? true : false
        self._loaningBranch = try? Branch(from: decoder, forType: .loaning)
        self._renewal = try? Renewal(from: decoder)
        self._vendor = try? Vendor(from: decoder)
    }
    
    public init(ID: Int?,
                barcode: String,
                format: Format?,
                bib: Bib,
                callNumber: String,
                checkoutDate: Date?,
                dueDate: Date?,
                renewal: Renewal?,
                assignedBranch: Branch?,
                loaningBranch: Branch?,
                billing: Billing?,
                isVisibleInPAC: Bool?,
                isElectronic: Bool?,
                vendor: Vendor?,
                designation: String?) {
        self._ID = ID
        self._barcode = barcode
        self._format = format
        self._bib = bib
        self._callNumber = callNumber
        self._checkoutDate = checkoutDate
        self._dueDate = dueDate
        self._renewal = renewal
        self._assignedBranch = assignedBranch
        self._loaningBranch = loaningBranch
        self._billing = billing
        self._isVisibleInPAC = isVisibleInPAC
        self._isElectronic = isElectronic
        self._vendor = vendor
        self._designation = designation
    }
}
