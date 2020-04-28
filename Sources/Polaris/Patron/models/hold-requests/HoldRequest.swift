//
//  HoldRequest.swift
//  Polaris
//
//  Created by Andrew Despres on 11/1/19.
//  Copyright © 2019 Downey City Library. All rights reserved.
//

import Foundation

extension Patron {
    
    public class HoldRequest: Decodable {
        
        // MARK: - Private Properties (Get/Set)
        private var _activationDate: Date?
        private var _bib: Bib
        private var _expirationDate: Date?
        private var _format: Format
        private var _groupName: String?
        private var _id: Int?
        private var _isBorrowByMail: Bool?
        private var _isItemLevelRequest: Bool?
        private var _notes: String?
        private var _pickupBranch: PickupBranch
        private var _pickupDate: Date?
        private var _queue: Queue
        private var _status: Status
        
        // MARK: - Public Properties (Get Only)
        public var activationDate: Date? { get { return _activationDate } }
        public var bib: Bib { get { return _bib } }
        public var expirationDate: Date? { get { return _expirationDate } }
        public var format: Format { get { return _format } }
        public var groupName: String? { get { return _groupName } }
        public var id: Int? { get { return _id } }
        public var isBorrowByMail: Bool? { get { return _isBorrowByMail } }
        public var isItemLevelRequest: Bool? { get { return _isItemLevelRequest } }
        public var notes: String? { get { return _notes } }
        public var pickupBranch: PickupBranch { get { return _pickupBranch } }
        public var pickupDate: Date? { get { return _pickupDate } }
        public var queue: Queue { get { return _queue } }
        public var status: Status { get { return _status } }
        
        // MARK: - Coding Keys
        private enum CodingKeys: String, CodingKey {
            
            case activationDate = "ActivationDate"
            case expirationDate = "ExpirationDate"
            case groupName = "GroupName"
            case id = "HoldRequestID"
            case isBorrowByMail = "BorrowByMail"
            case isItemLevelRequest = "ItemLevelHold"
            case notes = "PACDisplayNotes"
            case pickupDate = "PickupByDate"
        }
        
        // MARK: - Initialization
        required public init(from decoder: Decoder) throws {
            let data = try decoder.container(keyedBy: CodingKeys.self)
            
            _activationDate = (try? data.decode(String.self, forKey: .activationDate))?.toDate()
            _bib = try Bib(from: decoder)
            _expirationDate = (try? data.decode(String.self, forKey: .expirationDate))?.toDate()
            _format = try Format(from: decoder)
            _groupName = try? data.decode(String.self, forKey: .groupName)
            _id = try? data.decode(Int.self, forKey: .id)
            _isBorrowByMail = try? data.decode(Bool.self, forKey: .isBorrowByMail)
            _isItemLevelRequest = try? data.decode(Bool.self, forKey: .isItemLevelRequest)
            _notes = try? data.decode(String.self, forKey: .notes)
            _pickupBranch = try PickupBranch(from: decoder)
            _pickupDate = (try? data.decode(String.self, forKey: .pickupDate))?.toDate()
            _queue = try Queue(from: decoder)
            _status = try Status(from: decoder)
        }
        
        // MARK: - Private Methods
//        private func cancellingHoldComplete(response: CancelHoldResponse?, completion: @escaping (CancelHoldResponse?, PolarisError?) -> Void) {
//
//            guard let response = response else {
//                DispatchQueue.main.async { completion(nil, PolarisError.generalError) }
//                return
//            }
//
//            DispatchQueue.main.async {
//                if response.error != nil { completion(response, response.error) }
//                else {
//                    Polaris.activePatron?.holdRequests?.removeRequest(self)
//                    completion(response, nil)
//                }
//            }
//        }
        
//        private func startCancellingHold(completion: @escaping (CancelHoldResponse?, PolarisError?) -> Void) {
//            guard let barcode = Polaris.activePatron?.barcode else { return }
//            guard let id = id else { return }
//            guard let user = Polaris.authenticatedStaffUser?.polarisUserID else { return }
//            
//            let request = CancelHoldRequest(userId: user, workstationId: 1)
//                        
//            Polaris.PatronAccount.cancelHoldRequest(barcode: barcode, request: request, requestId: id, userId: user, workstationId: 1) { [weak self] (response) in
//                self?.cancellingHoldComplete(response: response, completion: completion)
//            }
//        }
        
        // MARK: - Public Methods
//        public func cancel(completion: @escaping (CancelHoldResponse?, PolarisError?) -> Void) {
//            startCancellingHold(completion: completion)
//        }
    }
}

// MARK: - Patron + HoldRequest + Format
extension Patron.HoldRequest {
    
    public class Format {
        
        // MARK: - Private Properties (Get/Set)
        private var _description: String?
        private var _id: Int?
        
        // MARK: - Public Properties (Get Only)
        public var description: String? { get { return _description } }
        public var id: Int? { get { return _id } }
        
        // MARK: - Coding Keys
        private enum CodingKeys: String, CodingKey {
            
            case description = "FormatDescription"
            case id = "FormatID"
        }
        
        // MARK: - Initialization
        required public init(from decoder: Decoder) throws {
            let data = try decoder.container(keyedBy: CodingKeys.self)
            
            _description = try? data.decode(String.self, forKey: .description)
            _id = try? data.decode(Int.self, forKey: .id)
        }
    }
}

// MARK: - Patron + HoldRequest + Status
extension Patron.HoldRequest {
    
    public class Status {
        
        // MARK: - Private Properties (Get/Set)
        private var _description: String?
        private var _id: Int?
        
        // MARK: - Public Properties (Get Only)
        public var description: String? { get { return _description } }
        public var id: Int? { get { return _id } }
        
        // MARK: - Coding Keys
        private enum CodingKeys: String, CodingKey {
            
            case description = "StatusDescription"
            case id = "StatusID"
        }
        
        // MARK: - Initialization
        required public init(from decoder: Decoder) throws {
            let data = try decoder.container(keyedBy: CodingKeys.self)
            
            _description = try? data.decode(String.self, forKey: .description)
            _id = try? data.decode(Int.self, forKey: .id)
        }
    }
}

// MARK: - Patron + HoldRequest + PickupBranch
extension Patron.HoldRequest {
    
    public class PickupBranch {
        
        // MARK: - Private Properties (Get/Set)
        private var _id: Int?
        private var _name: String?
        
        // MARK: - Public Properties (Get Only)
        public var id: Int? { get { return _id } }
        public var name: String? { get { return _name } }
        
        // MARK: - Coding Keys
        private enum CodingKeys: String, CodingKey {
            
            case id = "PickupBranchID"
            case name = "PickupBranchName"
        }
        
        // MARK: - Initialization
        required public init(from decoder: Decoder) throws {
            let data = try decoder.container(keyedBy: CodingKeys.self)
            
            _id = try? data.decode(Int.self, forKey: .id)
            _name = try? data.decode(String.self, forKey: .name)
        }
    }
}

// MARK: - Patron + HoldRequest + Queue
extension Patron.HoldRequest {
    
    public class Queue {
        
        // MARK: - Private Properties (Get/Set)
        private var _position: Int?
        private var _total: Int?
        
        // MARK: - Public Properties (Get Only)
        public var position: Int? { get { return _position } }
        public var total: Int? { get { return _total } }
        
        // MARK: - Coding Keys
        private enum CodingKeys: String, CodingKey {
            
            case position = "QueuePosition"
            case total = "QueueTotal"
        }
        
        // MARK: - Initialization
        required public init(from decoder: Decoder) throws {
            let data = try decoder.container(keyedBy: CodingKeys.self)
            
            _position = try? data.decode(Int.self, forKey: .position)
            _total = try? data.decode(Int.self, forKey: .total)
        }
    }
}
