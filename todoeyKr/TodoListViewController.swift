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
    
    let defaults = UserDefaults.standard
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // set defaults to stay in the app even if it crashes KEVIN!
        if let items = defaults.array(forKey: "TodoListArray") as? [String] {
            itemArray = items
        }
        
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
            //what will happen after user clicks on the plus sign button. Adding it to the array
            self.itemArray.append(alertTextFromUser.text!)
            
            // /Users/kevinrex/Library/Developer/CoreSimulator/Devices/2EE33B41-092E-465F-AC1F-EE2BF0248259/data/Containers/Data/Application/C54E6F0E-69EB-4A95-88B2-C8CF3A7570C1/Documents
            
            
            self.defaults.set(self.itemArray, forKey: "TodoListArray")
            
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
    


