//
//  RankCell.swift
//  Ranked
//
//  Created by Daniel Aditya Istyana on 19/09/19.
//  Copyright © 2019 Daniel Aditya Istyana. All rights reserved.
//

import UIKit

class RankCell: UITableViewCell {

  @IBOutlet weak var rankLabel: UILabel!
  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
