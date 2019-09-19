//
//  Steps.swift
//  Ranked
//
//  Created by Daniel Aditya Istyana on 19/09/19.
//  Copyright © 2019 Daniel Aditya Istyana. All rights reserved.
//

import Foundation
import CloudKit

enum Steps: String {
  case username
  case stepsCount
}

extension CKRecord {
  subscript(key: Steps) -> Any? {
    get {
      return self[key.rawValue]
    } set {
      self[key.rawValue] = newValue as? CKRecordValue
    }
  }
}
