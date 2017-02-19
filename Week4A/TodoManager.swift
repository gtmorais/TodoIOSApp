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
    
    static func deleteTodo(todo:Todo){
        databaseRef.child("Todos").child(todo.id).removeValue()
     }
    
    static func fillTodos(completion: @escaping(_ result:String) -> Void) {
        TodoManager.todos.removeAll()
        
        databaseRef.child("Todos").observe(.childAdded, with:{
            snapshot in
            print(snapshot)
            if let result = snapshot.value as? [String:AnyObject]{
                let p = Todo(id: snapshot.key,title: result["title"]! as! String, text: result["text"]! as! String, done: NSString(string:result["done"]! as! String).boolValue )
                TodoManager.todos.append(p)
                
            }
            completion("")
        })
    }

    
    static func getTodo(id:String, completion: @escaping(_ result:String) -> Void) -> Todo {
//        databaseRef.child("Todos").queryOrderedByKey().observe(.childAdded, with:{
//            snapshot in
//            print(snapshot.key)
//
//        })
            var myTodo=Todo()
            databaseRef.child("Todos").queryEqual(toValue: "id", childKey: id).observe(.childAdded, with:{
            snapshot in
            print(snapshot)
            if let result = snapshot.value as? [String:AnyObject]{
                myTodo = Todo(id: snapshot.key,title: result["title"]! as! String, text: result["text"]! as! String, done: NSString(string:result["done"]! as! String).boolValue )
            }
            completion("")
        })
        
        return myTodo
    }
}
