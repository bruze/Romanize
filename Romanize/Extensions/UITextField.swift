//
//  UITextField.swift
//  Romanize
//
//  Created by Bruno Garelli on 9/23/18.
//  Copyright © 2018 Bruno Garelli. All rights reserved.
//

import UIKit
extension UITextField {
    func textAfter(applying change: String, at index: String.Index) -> String {
        let isDeleting = change.isEmpty
        if var current = self.text {
            if isDeleting {
                current.remove(at: index)
                return current
            } else {
                current.insert(contentsOf: change, at: index)
                return current
            }
        } else {
            return change
        }
    }
}
