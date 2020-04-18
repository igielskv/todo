//
//  TodoViewController.swift
//  todo
//
//  Created by Manoli on 18/04/2020.
//  Copyright © 2020 Manoli. All rights reserved.
//

import UIKit

class TodoViewController: UIViewController {

    @IBOutlet weak var todoItemTextField: UITextField!
    @IBOutlet weak var prioritySegmentedControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        NetworkService.shared.getTodos()
    }

    @IBAction func addTodoButtonTapped(_ sender: Any) {
    }
    
}

