//
//  PrimaryButton.swift
//  Ranked
//
//  Created by Daniel Aditya Istyana on 18/09/19.
//  Copyright © 2019 Daniel Aditya Istyana. All rights reserved.
//

import UIKit

class PrimaryButton: UIButton {

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    
    self.layer.cornerRadius = 12
    self.setTitleColor(Theme.gray4, for: .normal)
    self.backgroundColor = Theme.primary
  }
}
