//
//  TableViewCell1.swift
//  3900 RequestAPI 01
//
//  Created by Trương Quang on 7/23/19.
//  Copyright © 2019 truongquang. All rights reserved.
//

import UIKit

class TableViewCell1: UITableViewCell {

    @IBOutlet weak var lblDescriptionContent0: UILabel!
    @IBOutlet weak var lblContent0: UILabel!
    @IBOutlet weak var lblDescriptionContent1: UILabel!
    @IBOutlet weak var lblContent1: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
