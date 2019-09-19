//
//  AuthorizationController.swift
//  Ranked
//
//  Created by Daniel Aditya Istyana on 18/09/19.
//  Copyright © 2019 Daniel Aditya Istyana. All rights reserved.
//

import UIKit
import HealthKit

class AuthorizationController: UIViewController {
  
  var healthKitIsAuthorized = false
  
  @IBAction func authorizeButtonTapped(_ sender: PrimaryButton) {
    authorizeHealthKit()
    DispatchQueue.main.async {
      self.dismiss(animated: true, completion: nil)
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    title = "Authorization Request"
    
  }
  
  func authorizeHealthKit() {
    HealthKitSetupHelper.authorizeHealthKit { (authorized, error) in
      guard authorized else {
        let baseErrorMessage = "HealthKit Authorization Failed"
        
        if let error = error {
          print("\(baseErrorMessage). Reason: \(error.localizedDescription)")
        } else {
          print(baseErrorMessage)
        }
        return
      }
      print("HealthKit succesfully authorized")
      self.healthKitIsAuthorized = true
    }
  }

}
