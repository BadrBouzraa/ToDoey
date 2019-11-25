//
//  ViewController.swift
//  ToDoey
//
//  Created by Badr Bouzraa on 22.11.19.
//  Copyright © 2019 Badr Bouzraa. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    var itemArray = ["Aliue", "biettee", "Aliue" ,"Laaan"]
    let defaults = UserDefaults.standard
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let items = defaults.array(forKey: "TodoListArray") as? [String]{
            itemArray = items
        }
     
    }

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row]
        return cell
      
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        
        tableView.deselectRow(at: indexPath, animated: true)

        if let cell = tableView.cellForRow(at: indexPath) {
            if cell.accessoryType == .checkmark {
                cell.accessoryType = .none
                
               
            } else {
                cell.accessoryType = .checkmark
               
                
            }
        }
        
    }
   
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var newItem = UITextField()
       
        let alert = UIAlertController(title: "Add new Todoey Item", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add to List", style: .default) { (action) in
            
            self.itemArray.append(newItem.text!)
            self.defaults.set(self.itemArray, forKey: "TodoListArray")
            self.tableView.reloadData()
         
        }
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
           newItem = alertTextField
           print("now")
        }
        alert.addAction(action)
       present(alert, animated: true, completion: nil)
    }
    

}

