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
        private func item(with id: Int) -> Item? {
            let item = _all.filter { $0.id == id }
            if item.count > 0 { return item[0] }
            return nil
        }
        
        private func renewalComplete(response: RenewItemResponse?, completion: @escaping (Int, PolarisError?) -> Void) {
             guard let response = response else {
                 DispatchQueue.main.async { completion(0, PolarisError.generalError) }
                 return
             }
             
             DispatchQueue.main.async { [weak self] in
                 if response.results.items.count > 0 {
                    for renewedItem in response.results.items {
                        let item = self?.item(with: renewedItem.id)
                        item?.setDueDate(renewedItem.dueDate)
                        item?.renewal.incrementCount()
                    }
                    completion(response.results.items.count, nil) }
                 else if response.error != nil { completion(0, response.error) }
                 else { completion(0, PolarisError.generalError) }
             }
         }
         
         private func startRenewal(overrideErrors override: Bool, completion: @escaping (Int, PolarisError?) -> Void) {
             guard let barcode = Polaris.activePatron?.barcode else { return }
             guard let branch = Polaris.authenticatedStaffUser?.branchID else { return }
             guard let user = Polaris.authenticatedStaffUser?.polarisUserID else { return }
             
             let logonData = LogonData(branch: branch, user: user, workstation: 1)
             let request = RenewItemRequest(logonData: logonData, ignoreErrors: override)
             
             Polaris.PatronAccount.renewItem(barcode: barcode, itemId: 0, request: request) { [weak self] (response) in
                 self?.renewalComplete(response: response, completion: completion)
             }
         }
        
        private func uniqueItems(in a: [Item], and b: [Item]) -> [Item] {
            let setA = Set(a)
            let setB = Set(b)
            let difference = setA.subtracting(setB)
            
            return Array(difference)
        }
        
        // MARK: - Public Methods
        public func renewAll(overrideErrors override: Bool, completion: @escaping (Int, PolarisError?) -> Void) {
            startRenewal(overrideErrors: override) { (count, error) in completion(count, error) }
        }
        
        public func `return`(_ item: Item?) {
            guard let item = item else { return }
            
            _all = all.filter { $0.id != item.id }
            _lost = lost.filter { $0.id != item.id }
            _overdue = overdue.filter { $0.id != item.id }
            
            Polaris.activePatron?.itemCounts?.refresh()
        }
    }
}
