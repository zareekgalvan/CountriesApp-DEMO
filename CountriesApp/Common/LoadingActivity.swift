//
//  LoadingActivity.swift
//  CountriesApp
//
//  Created by Cesar Armando on 11/11/19.
//  Copyright © 2019 Cesar Armando. All rights reserved.
//

import Foundation
import UIKit

open class LoadingActivity {
    
    // MARK: - Properties
    internal static var spinner: UIActivityIndicatorView?
    public static var style: UIActivityIndicatorView.Style = .whiteLarge
    public static var baseBackColor = UIColor.black.withAlphaComponent(0.2)
    public static var baseColor = UIColor.getBackgroundColorApp()
    
    // MARK: - Public methods
    public static func start(style: UIActivityIndicatorView.Style = style, backColor: UIColor = baseBackColor, baseColor: UIColor = baseColor) {
        NotificationCenter.default.addObserver(self, selector: #selector(update), name: UIDevice.orientationDidChangeNotification, object: nil)
        if spinner == nil, let window = UIApplication.shared.keyWindow {
            let frame = UIScreen.main.bounds
            spinner = UIActivityIndicatorView(frame: frame)
            spinner?.backgroundColor = backColor
            spinner?.style = style
            spinner?.color = baseColor
            window.addSubview(spinner ?? UIView())
            spinner?.startAnimating()
        }
    }
    
    public static func stop() {
        if spinner != nil {
            spinner?.stopAnimating()
            spinner?.removeFromSuperview()
            spinner = nil
        }
    }
    
    @objc private static func update() {
        if spinner != nil {
            stop()
            start()
        }
    }
}
