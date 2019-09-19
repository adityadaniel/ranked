//
//  StepsDataStore.swift
//  Ranked
//
//  Created by Daniel Aditya Istyana on 18/09/19.
//  Copyright © 2019 Daniel Aditya Istyana. All rights reserved.
//

import HealthKit

class StepDataStore {
  
  class func getTodaySteps(completion: @escaping(Double, Error?) -> ()) {
    
    let storage = HKHealthStore()
    
    let stepsQuantityType = HKQuantityType.quantityType(forIdentifier: .stepCount)!
    
    let now = Date()
    let startOfDay = Calendar.current.startOfDay(for: now)
    
    let predicate = HKQuery.predicateForSamples(withStart: startOfDay, end: now, options: .strictStartDate)
    
    let query = HKStatisticsQuery(quantityType: stepsQuantityType, quantitySamplePredicate: predicate, options: .cumulativeSum) { (stats, results, error) in
      guard let results = results, let sum = results.sumQuantity() else {
        completion(0.0, nil)
        return
      }
      completion(sum.doubleValue(for: .count()), nil)
    }
    storage.execute(query)
  }
}
