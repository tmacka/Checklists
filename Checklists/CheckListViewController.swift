//
//  ViewController.swift
//  Checklists
//
//  Created by Tom MacKay on 12/08/2019.
//  Copyright © 2019 Tom MacKay. All rights reserved.
//

import UIKit

class CheckListViewController: UITableViewController, AddItemViewControllerDelegate {
    func addItemViewControllerDidCancel(_ controller: AddItemViewController) {
        navigationController?.popViewController(animated: true)
    }
    
    func addItemViewController(_ controller: AddItemViewController, didFinishAdding item: CheckListItem) {
        
        let newRowIndex = items.count
        items.append(item)
        
        let indexPath = IndexPath(row: newRowIndex, section: 0)
        let indexPaths = [indexPath]
        tableView.insertRows(at: indexPaths, with: .automatic)
        
        navigationController?.popViewController(animated: true)
    }
    
    

    var items = [CheckListItem]()
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let item0 = CheckListItem()
        item0.text = "test1"
        item0.checked = true
        items.append(item0)
        
        let item1 = CheckListItem()
        item1.text = "test2"
        item1.checked = true
        items.append(item0)
        
        // Do any additional setup after loading the view.
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Checklistitem", for: indexPath)
        
        let item = items[indexPath.row]
        configureText(for: cell, with: item)
        configureCheckMark(for: cell, with: item)
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let cell = tableView.cellForRow(at: indexPath) {
            
            let item = items[indexPath.row]
            
            item.toggleChecked()
          
            configureCheckMark(for: cell, with: item)
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        items.remove(at: indexPath.row)
        let indexPaths = [indexPath]
        tableView.deleteRows(at: indexPaths, with: .automatic)
    }
    
    func configureCheckMark(for cell:UITableViewCell, with item: CheckListItem) {
        //var isChecked = false
        
        
        if item.checked {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
    }
    
    func configureText(for cell: UITableViewCell, with item: CheckListItem) {
        let label = cell.viewWithTag(1000) as! UILabel
        label.text = item.text
    }
    

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddItem" {
            let controller = segue.destination as! AddItemViewController
            controller.delegate = self
        }
    }
}

