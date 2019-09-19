//
//  Theme.swift
//  Ranked
//
//  Created by Daniel Aditya Istyana on 17/09/19.
//  Copyright © 2019 Daniel Aditya Istyana. All rights reserved.
//

import Foundation
import UIKit

struct Theme {
  
  static let primary = UIColor(hue: 0.99, saturation: 0.76, brightness: 0.75, alpha: 1.00)
  static let gray1 = UIColor.rgb(red: 48, green: 49, blue: 54)
  static let gray2 = UIColor.rgb(red: 108, green: 110, blue: 122)
  static let gray3 = UIColor.rgb(red: 174, green: 175, blue: 183)
  static let gray4 = UIColor.rgb(red: 228, green: 228, blue: 231)
//  static let graxy5 = UIColor(hue: 240, saturation: 1, brightness: 95, alpha: 1)
  
  static func apply(to window: UIWindow) {    
    let navBar = UINavigationBar.appearance()
    navBar.barTintColor = Theme.primary
    navBar.tintColor = Theme.gray4
    
    let attributedString: [NSAttributedString.Key: Any] = [
      NSAttributedString.Key.foregroundColor: Theme.gray4,
    ]
    
    navBar.largeTitleTextAttributes = attributedString
    navBar.titleTextAttributes = attributedString
    navBar.prefersLargeTitles = true
  }
  
//  enum RubikFonts: String {
//    case light = "Rubik-Light"
//    case lightItalic = "Rubik-LightItalic"
//    case regular = "Rubik-Regular"
//    case regularItalic = "Rubik-Italic"
//    case medium = "Rubik-Medium"
//    case mediumItalic = "Rubik-MediumItalic"
//    case bold = "Rubik-Bold"
//    case boldItalic = "Rubik-BoldItalic"
//    case black = "Rubik-Black"
//    case blackItalic = "Rubik-BlackItalic"
//  }
}

