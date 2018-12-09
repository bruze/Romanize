//
//  Int.swift
//  Romanize
//
//  Created by Bruno Garelli on 9/18/18.
//  Copyright © 2018 Bruno Garelli. All rights reserved.
//

import Foundation
extension Int {
    func mod(_ module: Int) -> Int {
        return self % module
    }
    
    func div(_ divider: Int) -> Int {
        return self / divider
    }
    
    func romanRepresentation() -> String {
        return RomanNumbers().romanNumber(from: self)
    }
}
