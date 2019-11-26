//
//  ViewController.swift
//  ToDoey
//
//  Created by Badr Bouzraa on 22.11.19.
//  Copyright © 2019 Badr Bouzraa. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    var itemArray = [Item]()
    let defaults = UserDefaults.standard
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let newItem = Item()
        newItem.title = "Aliue"
     
        itemArray.append(newItem)
        
        let newItem2 = Item()
        newItem2.title = "Biete"
        itemArray.append(newItem2)
        
        let newItem3 = Item()
        newItem3.title = "DAs aba"
        itemArray.append(newItem3)
        
        
       
        
        if let items = defaults.array(forKey: "TodoListArray") as? [Item]{
          itemArray = items

        }
     
    }

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
   
        
   let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        let item = itemArray[indexPath.row]
        
        cell.textLabel?.text = item.title
        
//        Ternary operator --> instead if & else statement
//        value = condition ? valueIfTrue : valueIfFalse
//        set the cell.accessoryType depending on weather the item.done is true. if true set checkmark else set none
        cell.accessoryType = item.done == true ? .checkmark : .none
        
       
        
        return cell
      
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//    This line of code sets the done property to its oposite. If true (remove checkmark) it becomes false, if false (set checkmark) it becomes true. No need to have if else statement here. It basically reverse what it used to be.
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        
        
      
        
        tableView.reloadData()
        
        tableView.deselectRow(at: indexPath, animated: true)

        
        
    }
   
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
       
        let alert = UIAlertController(title: "Add new Todoey Item", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add to List", style: .default) { (action) in
            
            let newItem = Item()
            newItem.title = textField.text!
            
            self.itemArray.append(newItem)
            self.defaults.set(self.itemArray, forKey: "TodoListArray")
            self.tableView.reloadData()
         
        }
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
           textField = alertTextField
           print("now")
        }
        alert.addAction(action)
       present(alert, animated: true, completion: nil)
    }
    

}

