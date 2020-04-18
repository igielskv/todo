//
//  TodoTableViewCell.swift
//  todo
//
//  Created by Manoli on 18/04/2020.
//  Copyright © 2020 Manoli. All rights reserved.
//

import UIKit

class TodoTableViewCell: UITableViewCell {

    @IBOutlet weak var todoItemLabel: UILabel!
    @IBOutlet weak var priorityView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
