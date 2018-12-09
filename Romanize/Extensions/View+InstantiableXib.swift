//
//  View+InstantiableXib.swift
//  Nobly
//
//  Created by Bruno Garelli on 3/9/18.
//

import UIKit
/// This extension allows a `Custom View` to be easily loaded programatically
/// or within `Interface Builder`
/// All you have to do in order to use it is make sure your `view's init methods`
/// call `xibSetup` method.. and that's it
extension UIView {
    func xibSetup() {
        if let view = loadFromNib() {
            addSubview(view)
            stretch(view: view)
        }
    }

    func loadFromNib<T: UIView>() -> T? {
        let selfType = type(of: self)
        let bundle = Bundle(for: selfType)
        let nibName = String(describing: selfType)
        let nib = UINib(nibName: nibName, bundle: bundle)

        guard let view = nib.instantiate(withOwner: self, options: nil).first as? T else {
            print("Error loading nib with name \(nibName))")
            return nil
        }
        return view
    }
    
    /// Stretches the input view to the UIView frame using Auto-layout
    ///
    /// - Parameter view: The view to stretch.
    func stretch(view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: topAnchor),
            view.leftAnchor.constraint(equalTo: leftAnchor),
            view.rightAnchor.constraint(equalTo: rightAnchor),
            view.bottomAnchor.constraint(equalTo: bottomAnchor)
            ])
    }
}
