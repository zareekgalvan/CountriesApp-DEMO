//
//  UIViewController+Extension.swift
//  CountriesApp
//
//  Created by Cesar Armando on 11/11/19.
//  Copyright © 2019 Cesar Armando. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func adjustSafeAreaForCustomStatusBar() { }
    
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboardView(_:)))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboardView(_ sender: Any) {
        view.endEditing(true)
    }
}
