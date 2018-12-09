//
//  RomanView.swift
//  Romanize
//
//  Created by Bruno Garelli on 9/22/18.
//  Copyright © 2018 Bruno Garelli. All rights reserved.
//

import UIKit
class RomanView: UIView {
    var roman: String = ""
    @IBOutlet var label: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }
    
    private func commonInit() {
        self.xibSetup()
    }
}
