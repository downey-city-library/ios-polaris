//
//  RenewalResults.swift
//  Polaris
//
//  Created by Andrew Despres on 11/5/19.
//  Copyright © 2019 Downey City Library. All rights reserved.
//

import Foundation

public struct RenewalResults: Decodable {
    
    // MARK: - Private Properties (Get/Set)
    private var _blocks: [Block] = []
    private var _items: [Item] = []
    
    // MARK: - Public Properties (Get Only)
    public var blocks: [Block] { get { return _blocks } }
    public var items: [Item] { get { return _items } }
    
    // MARK: - Coding Keys
    private enum CodingKeys: String, CodingKey {
        
        case blockRows = "BlockRows"
        case itemRows = "DueDateRows"
    }
    
    // MARK: - Initialization
    public init(from decoder: Decoder) throws {
        let data = try decoder.container(keyedBy: CodingKeys.self)
        
        _blocks = try data.decode([Block].self, forKey: .blockRows)
        _items = try data.decode([Item].self, forKey: .itemRows)
    }
}

// MARK: - RenewalResults + Block
extension RenewalResults {
    
    public struct Block: Decodable {
        
        // MARK: - Private Properties (Get/Set)
        private var _allowsOverride: Bool
        private var _code: Int
        private var _description: String
        private var _itemId: Int
        private var _type: Int
        
        // MARK: - Public Properties (Get Only)
        public var allowsOverride: Bool { get { return _allowsOverride } }
        public var code: Int { get { return _code } }
        public var description: String { get { return _description } }
        public var itemId: Int { get { return _itemId } }
        public var type: Int { get { return _type } }
        
        // MARK: - Coding Keys
        private enum CodingKeys: String, CodingKey {
            
            case allowsOverride = "ErrorAllowOverride"
            case errorCode = "PolarisErrorCode"
            case errorDescription = "ErrorDesc"
            case errorType = "PAPIErrorType"
            case itemId = "ItemRecordID"
        }
        
        // MARK: - Initialization
        public init(from decoder: Decoder) throws {
            let data = try decoder.container(keyedBy: CodingKeys.self)
            
            _allowsOverride = try data.decode(Bool.self, forKey: .allowsOverride)
            _code = try data.decode(Int.self, forKey: .errorCode)
            _description = try data.decode(String.self, forKey: .errorDescription)
            _itemId = try data.decode(Int.self, forKey: .itemId)
            _type = try data.decode(Int.self, forKey: .errorType)
        }
    }
}

// MARK: - RenewalResults + Item
extension RenewalResults {
    
    public struct Item: Decodable {
        
        // MARK: - Private Properties (Get/Set)
        private var _dueDate: Date?
        private var _id: Int
        
        // MARK: - Public Properties (Get Only)
        public var dueDate: Date? { get { return _dueDate } }
        public var id: Int { get { return _id } }
        
        // MARK: - Coding Keys
        private enum CodingKeys: String, CodingKey {
            
            case dueDate = "DueDate"
            case id = "ItemRecordID"
        }
        
        // MARK: - Initialization
        public init(from decoder: Decoder) throws {
            let data = try decoder.container(keyedBy: CodingKeys.self)
            
            _dueDate = try? data.decode(String.self, forKey: .dueDate).toDate()
            _id = try data.decode(Int.self, forKey: .id)
        }
    }
}
