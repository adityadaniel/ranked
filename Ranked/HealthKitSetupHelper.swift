//
//  HealthKitHelper.swift
//  Ranked
//
//  Created by Daniel Aditya Istyana on 18/09/19.
//  Copyright © 2019 Daniel Aditya Istyana. All rights reserved.
//

import Foundation
import HealthKit

class HealthKitSetupHelper {
  
  enum HealthKitSetupError: Error {
    case notAvailableOnDevice
    case dataTypeNotAvailable
  }
  
  class func authorizeHealthKit(completion: @escaping(Bool, Error?) -> Void) {
    
    guard HKHealthStore.isHealthDataAvailable() else {
      completion(false, HealthKitSetupError.notAvailableOnDevice)
      return
    }
    
    guard let stepsData = HKObjectType.quantityType(forIdentifier: .stepCount) else {
      completion(false, HealthKitSetupError.dataTypeNotAvailable)
      return
    }
    
    let healthKitTypesToRead: Set<HKObjectType> = [stepsData]
    
    HKHealthStore().requestAuthorization(toShare: nil, read: healthKitTypesToRead) { (success, error) in
      completion(success, error)
    }
  }
}
