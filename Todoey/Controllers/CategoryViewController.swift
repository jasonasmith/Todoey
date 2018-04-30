//
//  CategoryViewController.swift
//  Todoey
//
//  Created by Jason Smith on 4/29/18.
//  Copyright © 2018 Jason Smith. All rights reserved.
//

import UIKit
import CoreData

class CategoryViewController: UITableViewController {
    
    var categoryArray = [Category]()
    let categoryContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    override func viewDidLoad() {
        super.viewDidLoad()

        // Calls function that loads data from the Items.plist
        
        loadCategories()
    }
    
    //MARK: - TableView Datasource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryArray.count
    }
    
    // Delegate method that figures out how we should display each of the cells
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let categoryCell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)

        categoryCell.textLabel?.text = categoryArray[indexPath.row].name
        
        return categoryCell
    }
    
    //MARK: -TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "goToItems", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! TodoListViewController
        
        if let indexpath = tableView.indexPathForSelectedRow {
            
            destinationVC.selectedCategory = categoryArray[indexpath.row]
            
        }
    }
    

    //MARK: - Add New Categories

    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Category", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Category", style: .default) { (action) in
            
            // What will happen once the user clicks the Add Category button on our UIAlert
            
            let newCategory = Category(context: self.categoryContext)
            newCategory.name = textField.text!

            self.categoryArray.append(newCategory)
            
            self.saveCategories()
            
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new category"
            textField = alertTextField
        }
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
  
    }

        //MARK: - Data Manipulation Methods
    
    func saveCategories() {
        print("saveCategories called")
        do {
            try categoryContext.save()
            
        } catch {
            print("Error saving categories \(error)")
        }
        
        self.tableView.reloadData()
    }
    
    func loadCategories() {
        
        let request: NSFetchRequest<Category> = Category.fetchRequest()
        
        print("loadCategories called")
        
        do{
            categoryArray = try categoryContext.fetch(request)
        } catch {
            print("Error loading categories \(error)")
        }
        
        tableView.reloadData()
    }
    
    
    
    

}
