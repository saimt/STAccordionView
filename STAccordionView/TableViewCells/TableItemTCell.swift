//
//  TableItemTCell.swift
//  STAccordionView
//
//  Created by Saim on 02/03/2020.
//  Copyright © 2020 Saim. All rights reserved.
//

import UIKit

class TableItemTCell: UITableViewCell {

    //MARK: Outlets
    @IBOutlet weak var tblHeight: NSLayoutConstraint!
    @IBOutlet weak var tblInside: UITableView!
    
    //MARK: Load
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
