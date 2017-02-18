//
//  TodoManager.swift
//  TodoApp
//
//  Created by Guilherme Morais on 2017-02-13.
//  Copyright © 2017 Guilherme Morais. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import FirebaseAuth

class TodoManager: NSObject {
    static let databaseRef = FIRDatabase.database().reference()
    static var todos = [Todo]()
    
    static func addTodo(title:String, text:String){
        let p = Todo(title: text, text: text)
        if(p.text != ""){
            //let uid = FIRAuth.auth()?.currentUser?.uid
            let todo =  [
                        "title":p.title,
                        "text":p.text
            ]
            databaseRef.child("todos").childByAutoId().setValue(todo)
        }
    }
    
    static func fillTodos(completion: @escaping(_ result:String) -> Void) {
        todos = []
        let allTodos = databaseRef.child("Todos")
        print(allTodos)
        let todo = databaseRef.child("Todos").observe(.childAdded, with: {
            snapshot in
            print(snapshot)
        })
        
        print(todo)
        
        databaseRef.child("Todos").observe(.childAdded, with:{
            snapshot in
            print(snapshot)
            if let result = snapshot.value as? [String:AnyObject]{
                    let p = Todo(title: result["Title"]! as! String, text: result["Text"]! as! String)
                    TodoManager.todos.append(p)
                
            }
            completion("")
        })
    }
}

class Todo {
    var username:String = ""
    var text: String = ""
    var title:String = ""
    
    init(){}
    
    init(title: String, text:String){
        self.text = text
        self.title = title
    }
}
