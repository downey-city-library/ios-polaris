//
//  Items.swift
//  Polaris
//
//  Created by Andrew Despres on 8/1/19.
//  Copyright © 2019 Downey City Library. All rights reserved.
//

import Foundation

public class Items: Decodable {
    // MARK: - Private Properties (Get/Set)
    private var _lost: [Item]
    private var _out: [Item]
    private var _overdue: [Item]
    
    // MARK: - Public Properties (Get Only)
    public var lost: [Item] { get { return _lost } }
    public var out: [Item] { get { return _out } }
    public var overdue: [Item] { get { return _overdue } }
    
    // MARK: - Initialization
    required public init(from decoder: Decoder) throws {
        let data = try decoder.container(keyedBy: CodingKeys.self)
        self._lost = []
        self._out = (try? data.decode([Item].self, forKey: .rows)) ?? []
        self._overdue = []
    }
    
    public init() {
        self._lost = []
        self._out = []
        self._overdue = []
    }
}

extension Items {
    // MARK: - Coding Keys
    enum CodingKeys: String, CodingKey {
        case rows = "PatronItemsOutGetRows"
    }
}

extension Items {
    // MARK: - Public Methods
    public func append(_ item: Item, to set: ItemSet) {
        switch set {
        case .lost: _lost.append(item)
        case .out: _out.append(item)
        case .overdue: _overdue.append(item)
        }
    }
    
    public func append(_ items: [Item], to set: ItemSet) {
        switch set {
        case .lost: _lost.append(contentsOf: items)
        case .out: _out.append(contentsOf: items)
        case .overdue: _overdue.append(contentsOf: items)
        }
    }
    
    public func remove(_ item: Item, from set: ItemSet) {
        switch set {
        case .lost: if let index = _lost.firstIndex(of: item) { _lost.remove(at: index) }
        case .out: if let index = _out.firstIndex(of: item) { _out.remove(at: index) }
        case .overdue: if let index = _overdue.firstIndex(of: item) { _overdue.remove(at: index) }
        }
    }
}
