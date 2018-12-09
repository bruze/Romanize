//
//  String.swift
//  Romanize
//
//  Created by Bruno Garelli on 9/23/18.
//  Copyright © 2018 Bruno Garelli. All rights reserved.
//

import Foundation
extension String {
    /// Returns if String is a number
    public func isNumber() -> Bool {
        return NumberFormatter().number(from: self) != nil ? true : false
    }

    public func index(forChangeAt range: NSRange) -> String.Index {
        let start = self.startIndex
        let end = self.endIndex
        if range.location == 0 {
            return start
        } else if range.location == self.count {
            return end
        }
        return self.index(start, offsetBy: range.location)
    }
}
