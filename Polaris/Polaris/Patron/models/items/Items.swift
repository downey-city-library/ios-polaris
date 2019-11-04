//
//  Items.swift
//  Polaris
//
//  Created by Andrew Despres on 8/1/19.
//  Copyright © 2019 Downey City Library. All rights reserved.
//

import Foundation

extension Patron {
    
    public class Items {
        
        // MARK: - Private Properties (Get/Set)
        private var _all: [Item] = []
        private var _lost: [Item] = []
        private var _out: [Item] { return uniqueItems(in: all, and: overdue) }
        private var _overdue: [Item] = []
        
        // MARK: - Public Properties (Get Only)
        public var all: [Item] { get { return _all } }
        public var lost: [Item] { get { return _lost } }
        public var out: [Item] { get { return _out } }
        public var overdue: [Item] { get { return _overdue } }
        
        // MARK: - Public Setter
        public func append(_ items: [Item], to set: ItemSet) {
            switch set {
            case .all: _all.append(contentsOf: items)
            case .lost: _lost.append(contentsOf: items)
            case .overdue: _overdue.append(contentsOf: items)
            }
        }
        
        // MARK: - Private Methods
        private func uniqueItems(in a: [Item], and b: [Item]) -> [Item] {
            let setA = Set(a)
            let setB = Set(b)
            let difference = setA.subtracting(setB)
            
            return Array(difference)
        }
    }
}
