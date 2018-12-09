//
//  Roman.swift
//  Romanize
//
//  Created by Bruno Garelli on 9/16/18.
//  Copyright © 2018 Bruno Garelli. All rights reserved.
//

import Foundation

struct RomanNumbers {
    /**
     - Parameters:
     - number: The number we're trying to represent
     - digit : The order of digits we're working on

     - Returns: A string object representing the integer in roman numbers' style
    */
    private func romanStyle(for number: Int, digit: RomanDigitReference) -> String {
        switch number {
        case 0:
            return ""
        case 1...3:
            return Romanize.oneRomanXTimes(number)(digit)
        case 4:
            return (oneRomanXTimes + fiveRoman)(1)(digit)
        case 5:
            return fiveRoman(roman: digit)
        case 6...8:
            return (fiveRoman + oneRomanXTimes)(number-5)(digit)
        case 9:
            return oneRomanXTimes(1)(digit) + digit.nextString()
        default:
            let lastDigit = number.mod(10)
            let rest = number.div(10)
            return romanStyle(for: rest, digit: digit.next) + romanStyle(for: lastDigit, digit: digit)
        }
    }
    
    func romanNumber(from integer: Int) -> String {
        return self.romanStyle(for: integer, digit: .I)
    }
    
    private func integerStyle(for roman: String, digit: RomanDigitReference) -> Int {
        let probableNine = String(roman.suffix(2))
        let current = String(roman.prefix(1))
        if let currentDigit = RomanDigitReference.from(string: current) {
            if currentDigit.string() + currentDigit.nextString() == probableNine {
                if roman.count == probableNine.count {
                    return currentDigit.rawValue * 9
                } else {
                    return digit.previous.rawValue * 9 + self.integerStyle(for: String(roman.dropFirst(2)), digit: currentDigit.previous)
                }
            } else if roman.count == 1 {
                return currentDigit.rawValue
            } else {
                return currentDigit.rawValue + self.integerStyle(for: String(roman.dropFirst()), digit: currentDigit.previous)
            }
        }
        return 0
    }
    
    func integerRepresentation(from roman: String) -> String {
        return String(self.integerStyle(for: roman, digit: .M))
    }
}
