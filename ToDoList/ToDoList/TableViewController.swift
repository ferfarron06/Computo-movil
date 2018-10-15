//
//  TableViewController.swift
//  ToDoList
//
//  Created by Usuario invitado on 15/10/18.
//  Copyright © 2018 Usuario invitado. All rights reserved.
//

import UIKit

class ToDoTableViewController: UITableViewController {
    var todos = [ToDo]()

override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return todos.count
    }
    
override func tableView(_tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoCellIdentifier")
            else {
                    fatalError("Could not dequeue a cell")
        }
}
}
