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
  
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
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
   


}

