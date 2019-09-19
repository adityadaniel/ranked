//
//  ViewController.swift
//  Ranked
//
//  Created by Daniel Aditya Istyana on 17/09/19.
//  Copyright © 2019 Daniel Aditya Istyana. All rights reserved.
//

import UIKit
import CloudKit

class HomeViewController: UIViewController {
  
  var isOpenedFirstTime = true
  var stepsRetreived: Int = 0
  var recordId: CKRecord.ID?
  
  let container = CKContainer.default()
  
  @IBOutlet weak var walkImageView: UIImageView! {
    didSet {
      self.walkImageView.tintColor = Theme.primary
      self.walkImageView.bringSubviewToFront(cardView)
    }
  }
  
  @IBOutlet weak var chevronArrow: UIImageView! {
    didSet {
      self.chevronArrow.tintColor = Theme.gray4
    }
  }
  
  @IBOutlet weak var rankedView: UIView! {
    didSet {
      self.rankedView.backgroundColor = Theme.primary
      self.rankedView.layer.cornerRadius = 20
      
      self.rankedView.layer.shadowColor = UIColor.lightGray.cgColor
      self.rankedView.layer.shadowOffset = CGSize(width: 3, height: 3)
      self.rankedView.layer.shadowOpacity = 0.8
      self.rankedView.layer.shadowRadius = 4.0
      
      let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTapSegue))
      self.rankedView.addGestureRecognizer(tapGesture)
    }
  }
  
  @IBOutlet weak var letsPlayButton: PrimaryButton! {
    didSet {
      self.letsPlayButton.setTitle("Update your leaderboard score", for: .normal)
      self.letsPlayButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
    }
  }
  
  @IBOutlet weak var todayLabel: UILabel! {
    didSet {
      self.todayLabel.textColor = Theme.gray1
    }
  }
  
  @IBOutlet weak var cardView: UIView! {
    didSet {
      self.cardView.backgroundColor = Theme.gray4
      self.cardView.layer.cornerRadius = 20
      
      self.cardView.layer.shadowColor = UIColor.lightGray.cgColor
      self.cardView.layer.shadowOffset = CGSize(width: 3, height: 3)
      self.cardView.layer.shadowOpacity = 0.8
      self.cardView.layer.shadowRadius = 4.0
    }
  }
  
  @IBOutlet weak var stepsCountLabel: UILabel! {
    didSet {
      self.stepsCountLabel.textColor = Theme.gray1
      self.stepsCountLabel.text = "\(self.stepsRetreived)"
    }
  }
  
  @IBOutlet weak var stepsUnitLabel: UILabel! {
    didSet {
      self.stepsUnitLabel.text = "steps"
      self.stepsUnitLabel.textColor = Theme.gray1
    }
  }
  @IBOutlet weak var walkingIconImageView: UIImageView! {
    didSet {
      self.walkingIconImageView.image = UIImage(named: "walkicon")
    }
  }
  
  @IBAction func playButtonTapped(_ sender: PrimaryButton) {
    
    let publicDB = container.publicCloudDatabase
    let record = CKRecord(recordType: "Steps")
    record[.username] = "Aditya"
    record[.stepsCount] = Int.random(in: 2000...3000)
    
    print("Attempting to record")
    
    publicDB.save(record) { (record, error) in
      if let error = error {
        print(error.localizedDescription)
      } else {
        print("succesfully create new record")
        guard let record = record else { return }
        self.recordId = record.recordID
      }
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    title = "Hello, Aditya!"
  }
  
  func animate() {
    UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.8, options: .curveEaseInOut, animations: {
      self.rankedView.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
    }) { (isCompleted) in
      UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.8, options: .curveEaseInOut, animations: {
        self.rankedView.transform = .identity
      }, completion: nil)
    }
  }
  
  @objc func handleTapSegue() {
    animate()
    performSegue(withIdentifier: "ShowListConnectedSegue", sender: self)
  }
  
  
  // default implementation to set the status bar color to lightContent
  override var preferredStatusBarStyle: UIStatusBarStyle {
    return .lightContent
  }
  
  // set status bar color to light when using navigation controller
  override func viewDidAppear(_ animated: Bool) {
    navigationController?.navigationBar.barStyle = .black
    
    if isOpenedFirstTime {
      let storyboard = UIStoryboard(name: "CreateAccount", bundle: nil)
      let vc = storyboard.instantiateViewController(withIdentifier: "CreateAccount")
      isOpenedFirstTime = false
      present(vc, animated: true, completion: nil)
    } else {
      StepDataStore.getTodaySteps { (steps, error) in
        if let error = error {
          print(error)
        } else {
          self.stepsRetreived = Int(steps)
          DispatchQueue.main.async {
            self.stepsCountLabel.text = "\(self.stepsRetreived)"
          }
        }
      }
    }
  }
}
