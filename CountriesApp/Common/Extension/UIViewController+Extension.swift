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

extension UIView {
    func configureTableSection(labelText: String) -> UIView? {
        let format = "H:|-20-[v0]-20-|"
        
        let headerLabel: UILabel = {
            let label = UILabel()
            label.text = labelText
            label.translatesAutoresizingMaskIntoConstraints = false
            label.font = UIFont.systemFont(ofSize: 14)
            label.textColor = UIColor.getSettingsTextColor()
            return label
        }()
        
        let viewHeader = UIView()
        viewHeader.backgroundColor = UIColor.getSettingsBackgroundColor()
        viewHeader.addSubview(headerLabel)
        
        viewHeader.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0": headerLabel]))
        viewHeader.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-30-[v0]-10-|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0": headerLabel]))
        
        return viewHeader
    }
}
