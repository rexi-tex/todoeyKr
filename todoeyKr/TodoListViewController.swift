//
//  ViewController.swift
//  todoeyKr
//
//  Created by Kevin Rex on 7/13/19.
//  Copyright © 2019 Kevin Rex. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    var itemArray = ["First To Do","Second To Do","Third To Do Dude"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    //MARK - Tableview Datasource Methods
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        cell.textLabel?.text = itemArray[indexPath.row]
        
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    //MARK - tableView Delagate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print(itemArray[indexPath.row])
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }
        else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var alertTextFromUser = UITextField()
        
        let alert = UIAlertController(title: "Add New Todo Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            //what will happen after user clicks on the plus sign.
            self.itemArray.append(alertTextFromUser.text!)
            self.tableView.reloadData()
            print("succussfully added item to todo list")
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Type New Todo"
            alertTextFromUser = alertTextField
        }
        
        alert.addAction(action)
        
        //After selecting a item in the list stop hilighting the cell in the table view
        present(alert, animated: true, completion: nil)
        
        
    }
        
        
        
        
}
    


