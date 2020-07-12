//
//  ViewController.swift
//  Todoey
//
//  Created by Vishal Dabhole on 09/07/20.
//  Copyright © 2020 Vishal Dabhole. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    
    var itemArray = [Item]()
    
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        let newItem = Item()
        newItem.title = "One"
        itemArray.append(newItem)
        
        let newItem2 = Item()
               newItem2.title = "Two"
               itemArray.append(newItem2)
        
        let newItem3 = Item()
               newItem3.title = "Three"
               itemArray.append(newItem3)
        
        let newItem4 = Item()
               newItem4.title = "Four"
               itemArray.append(newItem4)
    
        if let items = defaults.array(forKey: "TodoListArray") as? [Item]  {
            itemArray = items
        }
        
    }
    
    
    
    override func tableView(_ tableView : UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView : UITableView, cellForRowAt indexPath : IndexPath ) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        cell.textLabel?.text = itemArray[indexPath.row].title
        
        
        cell.accessoryType = itemArray[indexPath.row].done ? .checkmark : .none
        
//        if itemArray[indexPath.row].done = true {
//            cell.accessoryType = .checkmark
//        }else {
//            cell.accessoryType = .none
//        }
        
        return cell
    }

    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       // print(itemArray[indexPath.row])
        
        
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
    
        tableView.reloadData()
        
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    
    
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        
        let alert = UIAlertController(title: "Add new todoey item", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            //what happens when add item is pressed
            
            let NewItem = Item()
            NewItem.title = textField.text!
            
            self.itemArray.append(NewItem)
            self.tableView.reloadData()
            self.defaults.set(self.itemArray, forKey: "TodoListArray")
            
            
            
        }
        
        
        alert.addAction(action)
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create New Item"
            
            textField = alertTextField
        }
        
        present(alert, animated: true, completion: nil)
        
    }
    
    
    
    
    
}

