//
//  ViewController.swift
//  ToDoey
//
//  Created by Ershad Ilkhan on 6/8/19.
//  Copyright © 2019 Ershad Ilkhan. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    
    var itemArray = ["find someone","buy milk","living in the wild"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
     //table view datasource methods.
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return itemArray.count
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .default, reuseIdentifier: "ToDoItemCell")
        
        
        cell.textLabel?.text = itemArray[indexPath.row]
        
        return cell
        
    }
    
    //table view delegate methods.
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
       // print("\(itemArray[indexPath.row])")
        
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
            
        } else {
            
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
            
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    // add new items.
    @IBAction func addButtonPressd(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            
            // what will happen once the user clicks the add item button on our UIAlert.
            
            self.itemArray.append(textField.text!)
            
            self.tableView.reloadData()
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
        }
        
          alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    

}

