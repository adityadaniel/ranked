//
//  RankController.swift
//  Ranked
//
//  Created by Daniel Aditya Istyana on 19/09/19.
//  Copyright © 2019 Daniel Aditya Istyana. All rights reserved.
//

import UIKit
import CloudKit

struct UserSteps {
  let name: String!
  let stepsCount: Int!
}

class RankController: UIViewController {
  
  var steps = [UserSteps]()
  
  
  @IBOutlet weak var myTableView: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    title = "Rank"
    myTableView.register(RankCell.self, forCellReuseIdentifier: "rankCellID")
  }
  
  
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(true)
    if let indexPath = myTableView.indexPathForSelectedRow {
      myTableView.deselectRow(at: indexPath, animated: true)
    }
    
    loadStepData()
  }
  
  func loadStepData() {
    let predicate = NSPredicate(value: true)
    let sort = NSSortDescriptor(key: "stepsCount", ascending: false)
    let query = CKQuery(recordType: "Steps", predicate: predicate)
    query.sortDescriptors = [sort]
    
    let operation = CKQueryOperation(query: query)
    operation.desiredKeys = ["username", "stepsCount"]
    operation.resultsLimit = 10
  
    
    operation.recordFetchedBlock = { record in
      let step = UserSteps(name: record["username"], stepsCount: record["stepsCount"])
      self.steps.append(step)
      DispatchQueue.main.async {
        //      if error == nil {
        //          print(newSteps)
        //        self.steps = newSteps
        self.myTableView.reloadData()
        //      } else {
        //        let ac = UIAlertController(title: "Fetch failed", message: "There was a problem fetching the list of steps; please try again: \(error!.localizedDescription)", preferredStyle: .alert)
        //        ac.addAction(UIAlertAction(title: "OK", style: .default))
        //        self.present(ac, animated: true)
        //      }
      }
    }
    

//
//    operation.queryCompletionBlock = { [unowned self] (cursor, error) in
//    }
    
    print("retreive")
    CKContainer.default().publicCloudDatabase.add(operation)
    print("final data: \(steps)")
  }

}


extension RankController: UITableViewDataSource, UITableViewDelegate {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    print(steps.count)
    return steps.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "rankCellID", for: indexPath)
    let step = steps[indexPath.row]
//    cell.textLabel!.text = "asd"
    cell.textLabel!.text = "\(indexPath.row + 1). \(step.name!) - \(step.stepsCount!)"
    return cell
  }
  
  
}
