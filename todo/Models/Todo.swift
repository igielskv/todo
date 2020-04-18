//
//  Todo.swift
//  todo
//
//  Created by Manoli on 18/04/2020.
//  Copyright © 2020 Manoli. All rights reserved.
//

import Foundation

struct Todos: Codable {
    let items: Array<Todo>
}

struct Todo: Codable {
    let item: String
    let priority: Int
}
