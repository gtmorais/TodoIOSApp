//
//  ViewController.swift
//  Week4A
//
//  Created by Guilherme Morais on 2017-01-31.
//  Copyright © 2017 Guilherme Morais. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    let todo = Todo()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //navigationController?.navigationBar.barTintColor = UIColor.lightText
        TodoManager.fillTodos() {  (result:String) in
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
        

    let data : [String] = ["Task 1", "Task 2", "Task 3 - Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu"]

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "rows", for: indexPath) as! CustomTableViewCell
        
        cell.cellTitle?.text = TodoManager.todos[indexPath.row].title //data[indexPath.row]
        cell.cellLabel?.text = TodoManager.todos[indexPath.row].text //data[indexPath.row]
        
        return cell
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return TodoManager.todos.count
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.delete) {
            // handle delete (by removing the data from your array and updating the tableview)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextScene =  segue.destination as! ViewControllerDetail

        nextScene.todo = Todo(title: "title", text: "text")
    }

    func login() -> Bool {
        let email = "gtmorais@gmail.com"
        let password = "todoapp"
        var success = false
        
        FirebaseManager.Login(email: email, password: password) { (success_:Bool) in
            if (success){
                success = success_
            }
        }
        
        return success
    }
    

}
