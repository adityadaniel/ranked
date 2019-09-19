//
//  CreateAccountController.swift
//  Ranked
//
//  Created by Daniel Aditya Istyana on 18/09/19.
//  Copyright © 2019 Daniel Aditya Istyana. All rights reserved.
//

import UIKit

class CreateAccountController: UIViewController, UITextFieldDelegate {
  
  var isFinishedSetup = false
  
  @IBOutlet weak var nameTextField: UITextField! {
    didSet {
      self.nameTextField.backgroundColor = Theme.gray4
    }
  }
  @IBOutlet weak var usernameTextField: UITextField! {
    didSet {
      self.usernameTextField.backgroundColor = Theme.gray4
    }
  }
  @IBOutlet weak var nextButton: PrimaryButton! {
    didSet {
      self.nextButton.backgroundColor = Theme.gray3
      self.nextButton.setTitleColor(Theme.gray1, for: .normal)
      self.nextButton.isEnabled = false
    }
  }
  @IBAction func nextButtonTapped(_ sender: PrimaryButton) {
    performSegue(withIdentifier: "PermissionSegue", sender: self)
  }
  
  var bothTextFieldIsFilled = false
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    nameTextField.delegate = self
    usernameTextField.delegate = self
    
    
    title = "Set Up Your Profile"
  }
  
  override var preferredStatusBarStyle: UIStatusBarStyle {
    return .lightContent
  }
  
  override func viewDidAppear(_ animated: Bool) {
    navigationController?.navigationBar.barStyle = .black
    
    if isFinishedSetup {
    } else {
      let storyboard = UIStoryboard(name: "Onboarding", bundle: nil)
      let vc = storyboard.instantiateViewController(withIdentifier: "OnboardingStoryboard")
      isFinishedSetup = true
      present(vc, animated: true, completion: nil)
    }
    
  }
  
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    return false
  }
  
  func textFieldDidEndEditing(_ textField: UITextField) {
    evaluateBothTextField()
  }
  
  func evaluateBothTextField() {
    if usernameTextField.text!.count > 0 && nameTextField.text!.count > 0 {
      self.nextButton.isEnabled = true
      self.nextButton.backgroundColor = Theme.primary
      self.nextButton.setTitleColor(Theme.gray4, for: .normal)
    }
  }
  
}
