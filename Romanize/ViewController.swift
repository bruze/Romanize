//
//  ViewController.swift
//  Romanize
//
//  Created by Bruno Garelli on 9/16/18.
//  Copyright © 2018 Bruno Garelli. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private var romanView: RomanView!
    
    fileprivate func displayRomanIfPossible(using text: String) {
        if let number = Int(text), 1..<Constants.maxNumberAllowed ~= number {
            self.display(roman: number)
        } else {
            self.hideRomanView()
        }
    }

    private func displayInteger(from representation: String) {
        self.romanView.label.text = RomanNumbers().integerRepresentation(from: representation)
        self.romanView.isHidden = false
    }
    
    private func display(roman number: Int) {
        self.romanView.label.text = number.romanRepresentation()
        self.romanView.isHidden = false
    }
    
    private func hideRomanView() {
        self.romanView.isHidden = true
    }
}

extension ViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        /*
         INTEGER TO ROMAN
         */
        guard let text = textField.text else {
            return false
        }
        let afterText = textField.textAfter(applying: string, at: text.index(forChangeAt: range))
        print(afterText.isNumber())
        self.displayRomanIfPossible(using: afterText)
        
        /* ROMAN TO INTEGER
         var index: String.Index = string.startIndex
        if range.location + range.length >= string.count {
        } else {
            index = string.index(string.startIndex, offsetBy: range.location)
        }
        self.displayInteger(from: textField.textAfter(applying: string, at: index))
         */
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
}
