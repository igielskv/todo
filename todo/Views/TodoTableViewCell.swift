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
    
    func updateCell(todo: Todo) {
        todoItemLabel.text = todo.item
        
        switch todo.priority {
        case 0:
            priorityView.backgroundColor = #colorLiteral(red: 1, green: 0.8, blue: 0, alpha: 1)
        case 1:
            priorityView.backgroundColor = #colorLiteral(red: 1, green: 0.5843137255, blue: 0, alpha: 1)
        case 2:
            priorityView.backgroundColor = #colorLiteral(red: 1, green: 0.231372549, blue: 0.1882352941, alpha: 1)
        default:
            priorityView.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
