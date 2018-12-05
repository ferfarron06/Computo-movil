//
//  ViewController.swift
//  Organizador
//
//  Created by Fer on 12/5/18.
//  Copyright © 2018 Fer. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, AddTask, ChangeButton {
    
    
 
    
    var tasks: [Task] = []

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        tasks.append(Task(name: "Test object"))
      
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath) as! TaskCell
        
        cell.taskNameLabel.text = tasks[indexPath.row].name
        
        if tasks[indexPath.row].checked {
            cell.checkBoxOutlet.setBackgroundImage(#imageLiteral(resourceName: "checkBoxFILLED "), for: UIControlState.normal)
        } else{
            cell.checkBoxOutlet.setBackgroundImage(#imageLiteral(resourceName: "checkBoxOUTLINE "), for: UIControlState.normal)
        }
        
        
        cell.delegate = self
        cell.indexP = indexPath.row
        cell.tasks = tasks
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! AddTaskController
        vc.delegate = self
    }
    
        func addTask(name: String) {
            tasks.append(Task(name: name))
            tableView.reloadData()
         }

    func changeButton(checked: Bool, index: Int) {
        tasks[index].checked = checked
        tableView.reloadData()
    }
    
}

class Task{
    var name = ""
    var checked = false
    
    convenience init(name: String){
        self.init()
        self.name = name
    }
}

