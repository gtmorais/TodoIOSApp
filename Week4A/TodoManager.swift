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
        let todo = Todo(title: title, text: text, done: false)
        if (title != ""){
            //let uid = FIRAuth.auth()?.currentUser?.uid
            let todoNew =  [
                        "title":todo.title,
                        "text":todo.text,
                        "done":String(false)
                //,
                //        "done":todo.done
            ]
            databaseRef.child("Todos").childByAutoId().setValue(todoNew)
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
                let p = Todo(snapshot: String(describing: result),title: result["title"]! as! String, text: result["text"]! as! String, done: NSString(string:result["done"]! as! String).boolValue )
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
    var done:Bool = false
    var snapshot:String = ""
    
    init(){}
    
    init(title: String, text:String, done:Bool){
        self.text = text
        self.title = title
        self.done = done
    }
    
    init(snapshot: String, title: String, text:String, done:Bool){
        self.snapshot = snapshot
        self.text = text
        self.title = title
        self.done = done
    }
}
