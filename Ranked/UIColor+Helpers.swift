//
//  UIColor+Helpers.swift
//  Ranked
//
//  Created by Daniel Aditya Istyana on 17/09/19.
//  Copyright © 2019 Daniel Aditya Istyana. All rights reserved.
//

import UIKit

extension UIColor {
  static public func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
    return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
  }
}
