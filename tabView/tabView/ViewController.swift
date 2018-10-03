//
//  ViewController.swift
//  tabView
//
//  Created by Usuario invitado on 3/10/18.
//  Copyright © 2018 Usuario invitado. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var listaAlumnos : [String] = ["Luis", "Isabel","Fer", "Norma", "Iker"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listaAlumnos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "celda", for: indexPath)
    //cell.backgroundColor = UIColor.black    color negro
        cell.textLabel?.text = listaAlumnos[indexPath.row]
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print(indexPath.row)    muestra el numero de renglon
        
        let celda = tableView.cellForRow(at: indexPath)
        celda?.accessoryType = .checkmark
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete{
            listaAlumnos.remove(at: indexPath.row)
        }
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let shareAction = UIContextualAction(style: .normal, title: "Compartir") { (UIContextualAction, UIView, (Bool) -> Void) in
        }
        let swipeConfiguration = UISwipeActionsConfiguration(actions: [shareAction])
        return swipeConfiguration
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

