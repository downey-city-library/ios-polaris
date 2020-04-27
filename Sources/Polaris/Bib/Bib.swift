//
//  Bib.swift
//  Polaris
//
//  Created by Andrew Despres on 11/25/19.
//  Copyright © 2019 Downey City Library. All rights reserved.
//

import Foundation

public class Bib {
    
    // MARK: - Private Properties (Get/Set)
    private var _authors: Authors
    private var _callNumber: String?
    private var _coden: String?
    private var _contents: String?
    private var _controlNumber: String?
    private var _currentHolds: Int?
    private var _description: String?
    private var _edition: String?
    private var _format: String?
    private var _frequency: String?
    private var _genres: [String?] = []
    private var _gpoItemNumber: String?
    private var _holdings: [BibHolding] = []
    private var _id: Int?
    private var _isbns: [String?] = []
    private var _issn: String?
    private var _items: Items
    private var _lccn: String?
    private var _medium: String?
    private var _notes: [String?] = []
    private var _oclc: String?
    private var _otherNumber: String?
    private var _publisher: Publisher?
    private var _series: String?
    private var _strn: String?
    private var _subjects: [String?] = []
    private var _summary: String?
    private var _targetAudience: String?
    private var _titles: Titles
    private var _upc: String?
    private var _volume: String?
    private var _webLink: String?
    
    // MARK: - Public Properties (Get Only)
    public var authors: Authors { get { return _authors } }
    public var callNumber: String? { get { return _callNumber } }
    public var coden: String? { get { return _coden } }
    public var contents: String? { get { return _contents } }
    public var controlNumber: String? { get { return _controlNumber } }
    public var currentHolds: Int? { get { return _currentHolds } }
    public var description: String? { get { return _description } }
    public var edition: String? { get { return _edition } }
    public var format: String? { get { return _format } }
    public var frequency: String? { get { return _frequency } }
    public var genres: [String?] { get { return _genres } }
    public var gpoItemNumber: String? { get { return _gpoItemNumber } }
    public var holdings: [BibHolding] { get { return _holdings } }
    public var id: Int? { get { return _id } }
    public var isbns: [String?] { get { return _isbns } }
    public var issn: String? { get { return _issn } }
    public var items: Items { get { return _items } }
    public var lccn: String? { get { return _lccn } }
    public var medium: String? { get { return _medium } }
    public var notes: [String?] { get { return _notes } }
    public var oclc: String? { get { return _oclc } }
    public var otherNumber: String? { get { return _otherNumber } }
    public var publisher: Publisher? { get { return _publisher } }
    public var series: String? { get { return _series } }
    public var strn: String? { get { return _strn } }
    public var subjects: [String?] { get { return _subjects } }
    public var summary: String? { get { return _summary } }
    public var targetAudience: String? { get { return _targetAudience } }
    public var titles: Titles { get { return _titles } }
    public var upc: String? { get { return _upc } }
    public var volume: String? { get { return _volume } }
    public var webLink: String? { get { return _webLink } }
    
    // MARK: - Coding Keys
    private enum CodingKeys: String, CodingKey {
        
        case author = "Author"
        case id = "BibID"
        case isbn = "ISBN"
        case issn = "ISSN"
        case oclc = "OCLCNumber"
        case title = "Title"
        case upc = "UPCNumber"
        case volumeNumber = "VolumeNumber"
    }
    
    // MARK: - Initialization
    public required init(from decoder: Decoder) throws {
        let data = try decoder.container(keyedBy: CodingKeys.self)
        
        _items = Items()
        _authors = Authors()
        _titles = Titles()
        
        _authors.setMain(to: try? data.decode(String.self, forKey: .author))
        _id = try? data.decode(Int.self, forKey: .id)
        
        _isbns.append((try? data.decode(String.self, forKey: .isbn))?.filter("0123456789".contains))
        _issn = try? data.decode(String.self, forKey: .issn)
        _oclc = try? data.decode(String.self, forKey: .oclc)
        _titles.setMain(to: try data.decode(String.self, forKey: .title))
        _upc = try? data.decode(String.self, forKey: .upc)
        _volume = try? data.decode(String.self, forKey: .volumeNumber)
    }
    
    public init() {
        _items = Items()
        _authors = Authors()
        _titles = Titles()
    }
    
    // MARK: - Internal Setters
    internal func setElementBy(id: Int, value: Any) {
        switch id {
        case 2: _publisher = Publisher(value as? String)
        case 3: _description = value as? String
        case 5: _edition = value as? String
        case 6: _isbns.append((value as? String)?.filter("0123456789".contains))
        case 7: _items.system.setTotal(to: value as? String)
        case 8: _currentHolds = Int(value as! String)
        case 9: _summary = value as? String
        case 10: _items.local.setTotal(to: value as? String)
        case 11: _controlNumber = value as? String
        case 13: _callNumber = value as? String
        case 15: _items.local.setAvailable(to: value as? String)
        case 16: _items.system.setAvailable(to: value as? String)
        case 17: _format = value as? String
        case 18: _authors.setMain(to: value as? String)
        case 19: _series = value as? String
        case 20: _subjects.append(value as? String)
        case 21: _authors.setAdded(to: value as? String)
        case 22: _titles.setAdded(to: value as? String)
        case 23: _lccn = (value as? String)?.filter("0123456789".contains)
        case 24: _issn = value as? String
        case 25: _otherNumber = value as? String
        case 27: _genres.append(value as? String)
        case 28: _notes.append(value as? String)
        case 29: _contents = value as? String
        case 30: _publisher?.setNumber(to: value as? String)
        case 33: _webLink = value as? String
        case 34: _titles.setUniform(to: value as? String)
        case 35: _titles.setMain(to: value as? String)
        case 36: _volume = value as? String
        case 37: _frequency = value as? String
        case 39: _titles.setFormer(to: value as? String)
        case 40: _titles.setLater(to: value as? String)
        case 41: _strn = value as? String
        case 42: _gpoItemNumber = value as? String
        case 43: _coden = value as? String
        case 44: _targetAudience = value as? String
        case 46: _medium = value as? String
        default: break
        }
    }
    
    // MARK: - Internal Methods
    internal func setHoldings(_ holdings: [BibHolding]) {
        _holdings = holdings
    }
    
    internal func supplement(using bib: Bib) {
        _authors.setAdded(to: bib.authors.added)
        if bib.callNumber != nil { _callNumber = bib.callNumber }
        if bib.coden != nil { _coden = bib.coden }
        if bib.contents != nil { _contents = bib.contents }
        if bib.controlNumber != nil { _controlNumber = bib.controlNumber }
        if bib.currentHolds != nil { _currentHolds = bib.currentHolds }
        if bib.description != nil { _description = bib.description }
        if bib.edition != nil { _edition = bib.edition }
        if bib.format != nil { _format = bib.format }
        if bib.frequency != nil { _frequency = bib.frequency }
        _genres = bib.genres
        if bib.gpoItemNumber != nil { _gpoItemNumber = bib.gpoItemNumber }
        if bib.id != nil { _id = bib.id }
        _isbns = bib.isbns
        if bib.issn != nil { _issn = bib.issn }
        _items = bib.items
        if bib.lccn != nil { _lccn = bib.lccn }
        if bib.medium != nil { _medium = bib.medium }
        _notes = bib.notes
        if bib.oclc != nil { _oclc = bib.oclc }
        if bib.otherNumber != nil { _otherNumber = bib.otherNumber }
        if bib.publisher != nil { _publisher = bib.publisher }
        if bib.series != nil { _series = bib.series }
        if bib.strn != nil { _strn = bib.strn }
        _subjects = bib.subjects
        if bib.summary != nil { _summary = bib.summary }
        if bib.targetAudience != nil { _targetAudience = bib.targetAudience }
        _titles.setAdded(to: bib.titles.added)
        _titles.setLater(to: bib.titles.later)
        _titles.setFormer(to: bib.titles.former)
        _titles.setUniform(to: bib.titles.uniform)
        if bib.upc != nil { _upc = bib.upc }
        if bib.volume != nil { _volume = bib.volume }
        if bib.webLink != nil { _webLink = bib.webLink }
    }
    
    // MARK: - Public Methods
    public func downloadFullRecord(completion: @escaping () -> Void) {
        guard let id = id else { return }
        
        startDownloadFullRecord(for: id, completion: completion)
    }
    
    public func downloadHoldings(completion: @escaping () -> Void) {
        guard let id = id else { return }
        
        startDownloadHoldings(for: id, completion: completion)
    }
    
    // MARK: - Private Methods
//    private func downloadFullRecordComplete(response: GetBibResponse?, completion: @escaping () -> Void) {
//        guard let bib = response?.bib else { return }
//        
//        supplement(using: bib)
//        completion()
//    }
    
    private func downloadHoldingsComplete(response: GetBibHoldingsResponse?, completion: @escaping () -> Void) {
        guard let holdings = response?.holdings else { return }
        
        setHoldings(holdings)
        completion()
    }
    
    private func startDownloadFullRecord(for id: Int, completion: @escaping () -> Void) {
//        Polaris.Bib.get(byID: id) { [weak self] (response) in
//            self?.downloadFullRecordComplete(response: response, completion: completion)
//        }
    }
    
    private func startDownloadHoldings(for id: Int, completion: @escaping () -> Void) {
        Polaris.Bib.getHoldings(forBib: id) { [weak self] (response) in
            self?.downloadHoldingsComplete(response: response, completion: completion)
        }
    }
}

// MARK: - Bib + Author
extension Bib {
    
    public struct Author {
        
        // MARK: - Private Properties (Get/Set)
        private var _birth: String?
        private var _death: String?
        private var _name: Name
        
        // MARK: - Public Properties
        public var birth: String? { get { return _birth } }
        public var death: String? { get { return _death } }
        public var name: Name { get { return _name } }
         
        // MARK: - Intialization
        public init(_ author: String?) {
            _name = Name()
            
            if let author = author {
                let parts = components(of: author)
                let commas = parts.count - 1
                
                switch commas {
                case 0:
                    _name.setFirst(to: parts[0])
                    _name.setFull(first: parts[0], last: nil)
                    _name.setLastFirst(last: nil, first: parts[0])
                    
                case 1:
                    if parts[1].contains("-") && parts[1].rangeOfCharacter(from: .decimalDigits) != nil {
                        _name.setFirst(to: parts[0])
                        _name.setFull(first: parts[0], last: nil)
                        _name.setLastFirst(last: nil, first: parts[0])
                        
                        let dates = years(in: parts[1])
                        _birth = dates[0].trimmingCharacters(in: .whitespacesAndNewlines)
                        _death = dates[1] != "" ? dates[1].trimmingCharacters(in: .whitespacesAndNewlines) : nil
                    } else {
                        _name.setFirst(to: parts[1])
                        _name.setFull(first: parts[1], last: parts[0])
                        _name.setLast(to: parts[0])
                        _name.setLastFirst(last: parts[0], first: parts[1])
                    }

                case 2:
                    _name.setFirst(to: parts[1])
                    _name.setFull(first: parts[1], last: parts[0])
                    _name.setLast(to: parts[0])
                    _name.setLastFirst(last: parts[0], first: parts[1])
                    
                    let dates = years(in: parts[2])
                    _birth = dates[0].trimmingCharacters(in: .whitespacesAndNewlines)
                    _death = dates[1] != "" ? dates[1].trimmingCharacters(in: .whitespacesAndNewlines) : nil
                    
                default: break
                }
            }
        }
        
        // MARK: - Private Methods
        private func components(of string: String) -> [String] {
            let components = string.components(separatedBy: ",")
            return components
        }
        
        private func years(in string: String) -> [String] {
            let components = string.components(separatedBy: "-")
            return components
        }
    }
}

// MARK: - Bib + Author + Name
extension Bib.Author {
    
    public struct Name {
        
        // MARK: - Private Properties (Get/Set)
        private var _first: String?
        private var _full: String?
        private var _last: String?
        private var _lastFirst: String?
        
        // MARK: - Public Properties (Get Only)
        public var first: String? { get { return _first } }
        public var full: String? { get { return _full } }
        public var last: String? { get { return _last } }
        public var lastFirst: String? { get { return _lastFirst } }
        
        // MARK: - Internal Setters
        internal mutating func setFirst(to value: String) { _first = trim(value) }
        internal mutating func setFull(first: String, last: String?) {
            let first = trim(first)
            if var last = last {
                last = trim(last)
                _full = "\(first) \(last)"
            } else { _full = first }
        }
        internal mutating func setLast(to value: String) { _last = trim(value) }
        internal mutating func setLastFirst(last: String?, first: String) {
            let first = trim(first)
            if var last = last {
                last = trim(last)
                _lastFirst = "\(last), \(first)"
            } else { _lastFirst = first }
        }
        
        // MARK: - Private Methods
        private func trim(_ string: String) -> String {
            return string.trimmingCharacters(in: .whitespacesAndNewlines).trimmingCharacters(in: .punctuationCharacters)
        }
    }
}

// MARK: - Bib + Authors
extension Bib {
    
    public struct Authors {
        
        // MARK: - Private Properties (Get/Set)
        private var _added: [Author?] = []
        private var _main: Author?
        
        // MARK: - Public Properties (Get Only)
        public var added: [Author?] { get { return _added } }
        public var main: Author? { get { return _main } }
        
        // MARK: - Internal Setters
        internal mutating func setAdded(to set: [Author?]) { _added = set }
        internal mutating func setAdded(to value: String?) { _added.append(Author(value)) }
        internal mutating func setMain(to value: String?) { _main = Author(value) }
    }
}

// MARK: - Bib + Items
extension Bib {
    
    public class Items {
        
        // MARK: - Public Properties (Get/Set)
        public var local: Local = Local()
        public var system: System = System()
    }
}

// MARK: - Bib + Items + Local
extension Bib.Items {
    
    public struct Local {
        
        // MARK: - Private Properties (Get/Set)
        private var _available: Int?
        private var _total: Int?
        
        // MARK: - Public Properties (Get Only)
        public var available: Int? { get { return _available } }
        public var total: Int? { get { return _total } }
        
        // MARK: - Internal Setters
        internal mutating func setAvailable(to value: String?) { _available = value != nil ? Int(value!) : nil }
        internal mutating func setTotal(to value: String?) { _total = value != nil ? Int(value!) : nil }
    }
}

// MARK: - Bib + Items + System
extension Bib.Items {
    
    public struct System {
        
        // MARK: - Private Properties (Get/Set)
        private var _available: Int?
        private var _total: Int?
        
        // MARK: - Public Properties (Get Only)
        public var available: Int? { get { return _available } }
        public var total: Int? { get { return _total } }
        
        // MARK: - Internal Setters
        internal mutating func setAvailable(to value: String?) { _available = value != nil ? Int(value!) : nil }
        internal mutating func setTotal(to value: String?) { _total = value != nil ? Int(value!) : nil }
    }
}

// MARK: - Bib + Publisher
extension Bib {
    
    public struct Publisher {
        
        // MARK: - Private Properties (Get/Set)
        private var _location: String?
        private var _name: String?
        private var _number: Int?
        private var _year: String?
        
        // MARK: - Public Properties
        public var location: String? { get { return _location } }
        public var name: String? { get { return _name } }
        public var number: Int? { get { return _number } }
        public var year: String? { get { return _year } }
        
        // MARK: - Initialization
        public init(_ publisher: String?) {
            if let publisher = publisher {
                _location = location(of: publisher)
                _name = name(of: publisher)
                _year = year(of: publisher)
            }
        }
        
        // MARK: - Internal Setters
        internal mutating func setNumber(to value: String?) { _number = value != nil ? Int(value!) : nil }
        
        // MARK: - Private Methods
        private func location(of publisher: String) -> String? {
            let components = publisher.components(separatedBy: ":")
            if components.count > 1 { return components[0].trimmingCharacters(in: .whitespacesAndNewlines) }
            
            return nil
        }
        
        private func name(of publisher: String) -> String? {
            let componentSet1 = publisher.components(separatedBy: ":")
            if componentSet1.count > 1 {
                let componentSet2 = componentSet1[1].components(separatedBy: ",")
                if componentSet2.count > 1 {
                    return componentSet2[0].trimmingCharacters(in: .whitespacesAndNewlines)
                }
            }
            
            return nil
        }
        
        private func year(of publisher: String) -> String? {
            let components = publisher.components(separatedBy: ",")
            if components.count > 1 {
                return components.last?.trimmingCharacters(in: .whitespacesAndNewlines).trimmingCharacters(in: ["c", "."])
            }
            
            return nil
        }
    }
}

// MARK: - Bib + Titles
extension Bib {
    
    public struct Titles {
        
        // MARK: - Private Properties (Get/Set)
        private var _added: [String?] = []
        private var _uniform: String?
        private var _main: String?
        private var _former: String?
        private var _later: String?
        
        // MARK: - Public Properties (Get Only)
        public var added: [String?] { get { return _added } }
        public var uniform: String? { get { return _uniform } }
        public var main: String? { get { return _main } }
        public var former: String? { get { return _former } }
        public var later: String? { get { return _later } }
        
        // MARK: - Internal Setters
        internal mutating func setAdded(to set: [String?]) { _added = set}
        internal mutating func setAdded(to value: String?) { _added.append(value) }
        internal mutating func setUniform(to value: String?) { _uniform = value }
        internal mutating func setMain(to value: String?) { _main = value }
        internal mutating func setFormer(to value: String?) { _former = value }
        internal mutating func setLater(to value: String?) { _later = value }
    }
}
