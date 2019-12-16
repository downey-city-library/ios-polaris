//
//  Item.swift
//  Polaris
//
//  Created by Andrew Despres on 11/2/19.
//  Copyright © 2019 Downey City Library. All rights reserved.
//

import Foundation

extension Patron {
    
    public class Item: Decodable {
        
        // MARK: - Private Properties (Get/Set)
        private var _assignedBranch: Branch
        private var _barcode: String?
        private var _bib: Bib
        private var _billing: Billing
        private var _callNumber: String?
        private var _checkoutDate: Date?
        private var _designation: String?
        private var _dueDate: Date?
        private var _format: Format
        private var _id: Int?
        private var _isElectronic: Bool?
        private var _isVisibleInPAC: Bool?
        private var _loaningBranch: Branch
        private var _renewal: Renewal
        private var _vendor: Vendor
        
        // MARK: - Public Properties (Get Only)
        public var assignedBranch: Branch { get { return _assignedBranch } }
        public var barcode: String? { get { return _barcode } }
        public var bib: Bib { get { return _bib } }
        public var billing: Billing { get { return _billing } }
        public var callNumber: String? { get { return _callNumber } }
        public var checkoutDate: Date? { get { return _checkoutDate } }
        public var designation: String? { get { return _designation } }
        public var dueDate: Date? { get { return _dueDate } }
        public var format: Format { get { return _format } }
        public var id: Int? { get { return _id } }
        public var isElectronic: Bool? { get { return _isElectronic } }
        public var isVisibleInPAC: Bool? { get { return _isVisibleInPAC } }
        public var loaningBranch: Branch  { get { return _loaningBranch } }
        public var renewal: Renewal { get { return _renewal } }
        public var vendor: Vendor { get { return _vendor } }
        
        // MARK: - Coding Keys
        private enum CodingKeys: String, CodingKey {
            
            case barcode = "Barcode"
            case callNumber = "CallNumber"
            case checkoutDate = "CheckOutDate"
            case designation = "Designation"
            case dueDate = "DueDate"
            case ID = "ItemID"
            case isElectronic = "ElectronicItem"
            case isVisibleInPAC = "DisplayInPAC"
        }
        
        // MARK: - Initialization
        required public init(from decoder: Decoder) throws {
            let data = try decoder.container(keyedBy: CodingKeys.self)
            
            _assignedBranch = try Branch(from: decoder, forType: .assigned)
            _barcode = try? data.decode(String.self, forKey: .barcode)
            _bib = try Bib(from: decoder)
            _billing = try Billing(from: decoder)
            _callNumber = (try? data.decode(String.self, forKey: .callNumber)) ?? ""
            _checkoutDate = (try? data.decode(String.self, forKey: .checkoutDate))?.toDate()
            _designation = try? data.decode(String.self, forKey: .designation)
            _dueDate = (try? data.decode(String.self, forKey: .dueDate))?.toDate()
            _format = try Format(from: decoder)
            _id = try? data.decode(Int.self, forKey: .ID)
            _isElectronic = try? data.decode(Bool.self, forKey: .isElectronic)
            _isVisibleInPAC = try? data.decode(Int.self, forKey: .isVisibleInPAC) == 1 ? true : false
            _loaningBranch = try Branch(from: decoder, forType: .loaning)
            _renewal = try Renewal(from: decoder)
            _vendor = try Vendor(from: decoder)
        }
        
        // MARK: - Internal Setters
        internal func setDueDate(_ dueDate: Date?) {
            _dueDate = dueDate
        }
        
        // MARK: - Private Methods
        private func renewalComplete(response: RenewItemResponse?, completion: @escaping (RenewItemResponse?, PolarisError?) -> Void) {
            guard let response = response else {
                DispatchQueue.main.async { completion(nil, PolarisError.generalError) }
                return
            }
            
            DispatchQueue.main.async { [weak self] in
                if response.results.items.count > 0 {
                    self?._dueDate = response.results.items[0].dueDate
                    self?.renewal.incrementCount()
                    completion(response, nil) }
                else if response.error != nil { completion(response, response.error) }
                else { completion(response, PolarisError.generalError) }
            }
        }
        
        private func startRenewal(overrideErrors override: Bool, completion: @escaping (RenewItemResponse?, PolarisError?) -> Void) {
            guard let barcode = Polaris.activePatron?.barcode else { return }
            guard let branch = Polaris.authenticatedStaffUser?.branchID else { return }
            guard let id = id else { return }
            guard let user = Polaris.authenticatedStaffUser?.polarisUserID else { return }
            
            let logonData = LogonData(branch: branch, user: user, workstation: 1)
            let request = RenewItemRequest(logonData: logonData, ignoreErrors: override)
            
            Polaris.PatronAccount.renewItem(barcode: barcode, itemId: id, request: request) { [weak self] (response) in
                self?.renewalComplete(response: response, completion: completion)
            }
        }
        
        // MARK: - Public Methods
        public func renew(overrideErrors override: Bool = false, completion: @escaping (RenewItemResponse?, PolarisError?) -> Void) {
            startRenewal(overrideErrors: override) { (response, error) in completion(response, error) }
        }
    }
}

// MARK: - Patron + Item + Equatable
extension Patron.Item: Equatable {
    
    public static func == (lhs: Patron.Item, rhs: Patron.Item) -> Bool {
        return lhs.barcode == rhs.barcode
    }
}

// MARK: - Patron + Item + Hashable
extension Patron.Item: Hashable {
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

// MARK: - Patron + Item + Billing
extension Patron.Item {
    
    public class Billing {
        
        // MARK: - Private Properties (Get/Set)
        private var _transactionIds: TransactionIds
        private var _wasNoticeSent: Bool?
        
        // MARK: - Public Properties (Get Only)
        public var transactionIds: TransactionIds { get { return _transactionIds } }
        public var wasNoticeSent: Bool? { get { return _wasNoticeSent } }
        
        // MARK: - Coding Keys
        private enum CodingKeys: String, CodingKey {
            
            case noticeSent = "BillingNoticeSent"
        }
        
        // MARK: - Initialization
        public required init(from decoder: Decoder) throws {
            let data = try decoder.container(keyedBy: CodingKeys.self)
    
            _transactionIds = try TransactionIds(from: decoder)
            _wasNoticeSent = try? data.decode(Bool.self, forKey: .noticeSent)
        }
    }
}

// MARK: - Patron + Item + Billing + TransactionIds
extension Patron.Item.Billing {
    
    public class TransactionIds {
        
        // MARK: - Private Properties (Get/Set)
        private var _overdue: Int?
        private var _processing: Int?
        private var _replacement: Int?
        
        // MARK: - Public Properties (Get Only)
        public var overdue: Int? { get { return _overdue } }
        public var processing: Int? { get { return _processing } }
        public var replacement: Int? { get { return _replacement } }
        
        // MARK: - Coding Keys
        private enum CodingKeys: String, CodingKey {
            
            case overdue = "OverdueChargeTxnID"
            case processing = "ProcessingChargeTxnID"
            case replacement = "ReplacementChargeTxnID"
        }
        
        // MARK: - Initialization
        public required init(from decoder: Decoder) throws {
            let data = try decoder.container(keyedBy: CodingKeys.self)
    
            _overdue = try? data.decode(Int.self, forKey: .overdue)
            _processing = try? data.decode(Int.self, forKey: .processing)
            _replacement = try? data.decode(Int.self, forKey: .replacement)
        }
    }
}

// MARK: - Patron + Item + Branch
extension Patron.Item {
    
    public class Branch {
        
        // MARK: - Private Properties (Get/Set)
        private var _id: Int?
        private var _name: String?
        
        // MARK: - Public Properties (Get Only)
        public var id: Int? { get { return _id } }
        public var name: String? { get { return _name } }
        
        // MARK: - Coding Keys
        private enum CodingKeys: String, CodingKey {
            
            case assignedBranchID = "AssignedBranchID"
            case assignedBranchName = "AssignedBranchName"
            case loaningBranchID = "LoaningBranchID"
            case loaningBranchName = "LoaningBranchName"
        }
        
        // MARK: - Initialization
        public required init(from decoder: Decoder, forType type: BranchType) throws {
            let data = try decoder.container(keyedBy: CodingKeys.self)
    
            switch type {
            case .assigned:
                _id = try? data.decode(Int.self, forKey: .assignedBranchID)
                _name = try? data.decode(String.self, forKey: .assignedBranchName)
    
            case .loaning:
                _id = try? data.decode(Int.self, forKey: .loaningBranchID)
                _name = try? data.decode(String.self, forKey: .loaningBranchName)
            }
        }
    }
}

// MARK: - Patron + Item + Branch + BranchType
extension Patron.Item.Branch {
    
    public enum BranchType {
        
        case assigned
        case loaning
    }
}

// MARK: - Patron + Item + Format
extension Patron.Item {
    
    public class Format {
        
        // MARK: - Private Properties (Get/Set)
        private var _id: Int?
        private var _description: String?
        
        // MARK: - Public Properties (Get Only)
        public var id: Int? { get { return _id } }
        public var description: String? { get { return _description } }
        
        // MARK: - Coding Keys
        private enum CodingKeys: String, CodingKey {
            
            case id = "FormatID"
            case description = "FormatDescription"
        }
        
        // MARK: - Initialization
        public required init(from decoder: Decoder) throws {
            let data = try decoder.container(keyedBy: CodingKeys.self)
    
            _id = try? data.decode(Int.self, forKey: .id)
            _description = try? data.decode(String.self, forKey: .description)
        }
    }
}

// MARK: - Patron + Item + Renewal
extension Patron.Item {
    
    public class Renewal {
        
        // MARK: - Private Properties (Get/Set)
        private var _count: Int?
        private var _limit: Int?
        private var _isAvailable: Bool?
        
        // MARK: - Public Properties (Get Only)
        public var count: Int? { get { return _count } }
        public var limit: Int? { get { return _limit } }
        public var isAvailable: Bool? { get { return _isAvailable } }
        
        // MARK: - Coding Keys
        private enum CodingKeys: String, CodingKey {
            
            case count = "RenewalCount"
            case limit = "RenewalLimit"
            case isAvailable = "CanItemBeRenewed"
        }
        
        // MARK: - Initialization
        public required init(from decoder: Decoder) throws {
            let data = try decoder.container(keyedBy: CodingKeys.self)

            _count = try? Int(data.decode(String.self, forKey: .count))
            _limit = try? Int(data.decode(String.self, forKey: .limit))
            _isAvailable = try? data.decode(Bool.self, forKey: .isAvailable)
        }
        
        // MARK: - Internal Methods
        internal func incrementCount() {
            guard let count = count, let limit = limit else { return }
            
            if count < limit { _count! += 1 }
            if count == limit { _isAvailable = false }
        }
    }
}

// MARK: - Patron + Item + Vendor
extension Patron.Item {
    
    public class Vendor {
        
        // MARK: - Private Properties (Get/Set)
        private var _accountName: String?
        private var _id: Int?
        private var _name: String?
        
        // MARK: - Public Properties (Get Only)
        public var accountName: String? { get { return _accountName } }
        public var id: Int? { get { return _id } }
        public var name: String? { get { return _name } }
        
        // MARK: - Coding Keys
        private enum CodingKeys: String, CodingKey {
            
            case accountName = "VendorAccountName"
            case id = "VendorObjectIdentifier"
            case name = "VendorName"
        }
        
        // MARK: - Initialization
        public init(from decoder: Decoder) throws {
            let data = try decoder.container(keyedBy: CodingKeys.self)
    
            _accountName = try? data.decode(String.self, forKey: .accountName)
            _id = try? data.decode(Int.self, forKey: .id)
            _name = try? data.decode(String.self, forKey: .name)
        }
    }
}
