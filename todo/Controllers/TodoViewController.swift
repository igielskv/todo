//
//  TodoViewController.swift
//  todo
//
//  Created by Manoli on 18/04/2020.
//  Copyright © 2020 Manoli. All rights reserved.
//

import UIKit

class TodoViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var todoItemTextField: UITextField!
    @IBOutlet weak var prioritySegmentedControl: UISegmentedControl!
    @IBOutlet weak var todoTable: UITableView!
    
    var todos = Array<Todo>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        todoTable.delegate = self
        todoTable.dataSource = self
        
        getTodos()
    }

    func getTodos() {
        NetworkService.shared.getTodos(onSuccess: { (todos) in
            self.todos = todos.items
            self.todoTable.reloadData()
        }) { (errorMessage) in
            debugPrint(errorMessage)
        }
    }
    
    @IBAction func addTodoButtonTapped(_ sender: Any) {
        guard let todoItem = todoItemTextField.text else {
            return
        }
        
        let todo = Todo(item: todoItem, priority: prioritySegmentedControl.selectedSegmentIndex)
        
        NetworkService.shared.addTodo(todo: todo, onSuccess: { (todos) in
            self.todos = todos.items
            self.todoTable.reloadData()
        }) { (errorMessage) in
            debugPrint(errorMessage)
        }
        
        todoItemTextField.text = ""
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        todos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "TodoCell") as? TodoTableViewCell {
            cell.updateCell(todo: todos[indexPath.row])
            return cell
        }
        
        return UITableViewCell()
    }
}

