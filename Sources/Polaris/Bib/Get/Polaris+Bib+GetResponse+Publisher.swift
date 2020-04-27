//
//  Polaris+Bib+GetResponse+Publisher.swift
//  Polaris
//
//  Created by Andrew Despres on 4/27/20.
//  Copyright © 2020 Downey City Library. All rights reserved.
//

import Foundation

extension Polaris.Bib.GetResponse {
    
    public struct Publisher {
        
        // MARK: - Properties
        public private(set) var location: String?
        public private(set) var name: String?
        public private(set) var number: Int?
        public private(set) var year: String?
        
        // MARK: - Setters
        mutating func setName(to value: String) {
            location = location(of: value)
            name = name(of: value)
            year = year(of: value)
        }
        
        mutating func setNumber(to value: String) {
            number = Int(value)
        }
        
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
