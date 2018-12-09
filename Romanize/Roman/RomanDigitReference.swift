//
//  Roman.swift
//  Romanize
//
//  Created by Bruno Garelli on 9/18/18.
//  Copyright © 2018 Bruno Garelli. All rights reserved.
//

import Foundation
/* * . . . . .* *\
 This is a reference to the digit place on the number;
 It's the value of the next letter coming up when we
 reach a new number with an additional digit (10, 100, 1000)
 _____________________________________________________
 ie: we can infer if we're calculating units, tens
 hundreds..
 */
enum RomanDigitReference: Int {
    case M = 1000
    case D = 500
    case C = 100
    case L = 50
    case X = 10
    case V = 5
    case I = 1
    
    func string() -> String {
        switch self {
        case .M:
            return "M"
        case .D:
            return "D"
        case .C:
            return "C"
        case .L:
            return "L"
        case .X:
            return "X"
        case .V:
            return "V"
        case .I:
            return "I"
        }
    }
    
    func nextString() -> String {
        return self.next.string()
    }
    
    var previous: RomanDigitReference {
        switch self {
        case .M:
            return .D
        case .D:
            return .C
        case .C:
            return .L
        case .L:
            return .X
        case .V:
            return .X
        case .X:
            return .I
        // Should not reach here but the idea is to keep it circular for future implementations
        case .I:
            return .M
        }
    }
    
    var next: RomanDigitReference {
        switch self {
        case .I:
            return .X
        case .V:
            return .X
        case .X:
            return .C
        case .L:
            return .C
        case .C:
            return .M
        case .D:
            return .M
        // Should not reach here but the idea is to keep it circular for future implementations
        case .M:
            return .I
        }
    }
    
    static func from(string representation: String) -> RomanDigitReference? {
        switch representation {
        case "M":
            return .M
        case "D":
            return .D
        case "C":
            return .C
        case "L":
            return .L
        case "X":
            return .X
        case "V":
            return .V
        case "I":
            return .I
        default:
            return nil
        }
    }
}
