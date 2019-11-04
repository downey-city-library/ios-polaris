//
//  HoldRequests.swift
//  Polaris
//
//  Created by Andrew Despres on 10/31/19.
//  Copyright © 2019 Downey City Library. All rights reserved.
//

import Foundation

extension Patron {
    
    public class HoldRequests {
        
        // MARK: - Private Properties (Get/Set)
        private var _active: [HoldRequest] = []
        private var _all: [HoldRequest] = []
        private var _cancelled: [HoldRequest] = []
        private var _expired: [HoldRequest] = []
        private var _held: [HoldRequest] = []
        private var _inactive: [HoldRequest] = []
        private var _notSupplied: [HoldRequest] = []
        private var _pending: [HoldRequest] = []
        private var _shipped: [HoldRequest] = []
        private var _unclaimed: [HoldRequest] = []
        
        // MARK: - Public Properties (Get Only)
        public var active: [HoldRequest] { get { return _active } }
        public var all: [HoldRequest] { get { return _all } }
        public var cancelled: [HoldRequest] { get { return _cancelled } }
        public var expired: [HoldRequest] { get { return _expired } }
        public var held: [HoldRequest] { get { return _held } }
        public var inactive: [HoldRequest] { get { return _inactive } }
        public var notSupplied: [HoldRequest] { get { return _notSupplied } }
        public var pending: [HoldRequest] { get { return _pending } }
        public var shipped: [HoldRequest] { get { return _shipped } }
        public var unclaimed: [HoldRequest] { get { return _unclaimed } }

        // MARK: - Public Setter
        public func append(_ holdRequests: [HoldRequest], to set: HoldRequestSet) {
            switch set {
            case .active: _active.append(contentsOf: holdRequests)
            case .all: _all.append(contentsOf: holdRequests)
            case .cancelled: _cancelled.append(contentsOf: holdRequests)
            case .expired: _expired.append(contentsOf: holdRequests)
            case .held: _held.append(contentsOf: holdRequests)
            case .inactive: _inactive.append(contentsOf: holdRequests)
            case .notSupplied: _notSupplied.append(contentsOf: holdRequests)
            case .pending: _pending.append(contentsOf: holdRequests)
            case .shipped: _shipped.append(contentsOf: holdRequests)
            case .unclaimed: _unclaimed.append(contentsOf: holdRequests)
            }
        }
    }
}
