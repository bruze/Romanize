//
//  RomanGears.swift
//  Romanize
//
//  Created by Bruno Garelli on 9/19/18.
//  Copyright © 2018 Bruno Garelli. All rights reserved.
//

import Foundation
typealias Romanizer = (Int) -> (RomanDigitReference) -> (String)
typealias Transform = (@escaping Romanizer) -> Romanizer

let oneRomanXTimes: Romanizer = { number in
    return { roman in
        var result: String = ""
        for _ in 1...number {
            result += roman.string()
        }
        return result
    }
}

infix operator +
/// Concatenate two Romanizer using same parameters
func +(lhs: @escaping Romanizer, rhs: @escaping Romanizer) -> Romanizer {
    return { number in
        return { roman in
            return lhs(number)(roman) + (rhs)(number)(roman)
        }
    }
}
/// Concatenate a Romanizer and a "direct" `romanDigitReference -> String` function
func +(lhs: @escaping (RomanDigitReference) -> String, rhs: @escaping Romanizer) -> Romanizer {
    return { number in
        return { roman in
            return (lhs)(roman) + rhs(number)(roman)
        }
    }
}
/// Same as method above but exchanging the order of execution
func +(lhs: @escaping Romanizer, rhs: @escaping (RomanDigitReference) -> String) -> Romanizer {
    return { number in
        return { roman in
            return lhs(number)(roman) + (rhs)(roman)
        }
    }
}

func fiveRoman(roman: RomanDigitReference) -> String {
    switch roman {
    case .I:
        return RomanDigitReference.V.string()
    case .X:
        return RomanDigitReference.L.string()
    case .C:
        return RomanDigitReference.D.string()
    case .M:
        return RomanDigitReference.I.string() // Should not reach here
    default:
        return "" // Or here
    }
}
