//
//  Encryption.swift
//  Polaris
//
//  Created by Andrew Despres on 3/12/19.
//  Copyright © 2019 Downey City Library. All rights reserved.
//
// Adapted from: https://gist.github.com/wdg/f7c8c4088030c59f0f45

import Foundation

internal class Encryption {
    
    // MARK: - Processing Constants
    static let k0 = 0x0ffffffff
    static let k1 = 0x5A827999
    static let k2 = 0x6ED9EBA1
    static let k3 = 0x8F1BBCDC
    static let k4 = 0xCA62C1D6
    
    // MARK: - Word Buffers
    static var h0 = 0x67452301
    static var h1 = 0xEFCDAB89
    static var h2 = 0x98BADCFE
    static var h3 = 0x10325476
    static var h4 = 0xC3D2E1F0
    
    // MARK: - Class Methods
    internal class func hash(_ input: String) -> String {
        
        let length = input.count
        
        var value = 0
        var word = [Int]()
        var words = [Int]()
        
        stride(from: 0, to: length - 3, by: 4).forEach { i in
            let j = input.code(for: i) << 24 | input.code(for: i + 1) << 16 | input.code(for: i + 2) << 8 | input.code(for: i + 3)
            
            words.append(j)
        }
        
        switch (length % 4) {
        case 0: value = 0x080000000
        case 1: value = input.code(for: length - 1) << 24 | 0x0800000
        case 2: value = input.code(for: length - 2) << 24 | input.code(for: length - 1) << 16 | 0x08000;
        case 3: value = input.code(for: length - 3) << 24 | input.code(for: length - 2) << 16 | input.code(for: length - 1) << 8 | 0x80
        default: break
        }
        
        words.append(value)
        
        while ((words.count % 16) != 14) {
            words.append(0)
        }
        
        words.append(length >> 29)
        words.append((length << 3) & k0)
        
        stride(from: 0, to: words.count, by: 16).forEach { block in
            for i in (0...15) {
                word.append(words[block + i])
            }
            
            for i in (16...79) {
                word.append((word[i - 3] ^ word[i - 8] ^ word[i - 14] ^ word[i - 16]).rotate(by: 1))
            }
            
            var a = h0
            var b = h1
            var c = h2
            var d = h3
            var e = h4
            
            for i in (0...19) {
                let temp = (a.rotate(by: 5) + ((b & c) | (~b & d)) + e + word[i] + k1) & k0
                e = d
                d = c
                c = b.rotate(by: 30)
                b = a
                a = temp
            }
            
            for i in (20...39) {
                let temp = (a.rotate(by: 5) + (b ^ c ^ d) + e + word[i] + k2) & k0
                e = d
                d = c
                c = b.rotate(by: 30)
                b = a
                a = temp
            }
            
            for i in (40...59) {
                let temp = (a.rotate(by: 5) + ((b & c) | (b & d) | (c & d)) + e + word[i] + k3) & k0
                e = d
                d = c
                c = b.rotate(by: 30)
                b = a
                a = temp
            }
            
            for i in (60...79) {
                let temp = (a.rotate(by: 5) + (b ^ c ^ d) + e + word[i] + k4) & k0
                e = d
                d = c
                c = b.rotate(by: 30)
                b = a
                a = temp
            }
            
            h0 = (h0 + a) & k0
            h1 = (h1 + b) & k0
            h2 = (h2 + c) & k0
            h3 = (h3 + d) & k0
            h4 = (h4 + e) & k0
        }
        
        let hash = "\(h0.toString())\(h1.toString())\(h2.toString())\(h3.toString())\(h4.toString())"
        return hash
    }
}
