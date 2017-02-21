//
//  TodoManager.swift
//  TodoApp
//
//  Created by Guilherme Morais on 2017-02-13.
//  Copyright © 2017 Guilherme Morais. All rights reserved.
//  Student #300878610

import UIKit
import Firebase
import FirebaseDatabase
import FirebaseAuth

//manages all persistence to firebase
class TodoManager: NSObject {
    static let databaseRef = FIRDatabase.database().reference()
    static var todos = [Todo]()
    static var todo = Todo()
    
    
    //add item to firebase
    static func addTodo(title:String, text:String){
        let todo = Todo(title: title, text: text, done: false)
        if (title != ""){
            //let uid = FIRAuth.auth()?.currentUser?.uid
            let todoNew =  [
                        "title":todo.title,
                        "text":todo.text,
                        "done":String(false)
            ]
            databaseRef.child("Todos").childByAutoId().setValue(todoNew)
        }
    }
    
    //delete todo from firebase
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
    
    //update todo on firebase
    static func updateTodo(todo:Todo)
    {
        databaseRef.child("Todos").child(todo.id).updateChildValues(
            [
                "done" : String(todo.done),
                "text" : todo.text,
                "title" : todo.title,
                ])
        
            fillTodos() {  (result:String) in
            DispatchQueue.main.async {
            }
        }
    }

    //get single todo from collection
    static func getTodo(id:String, completion: @escaping(_ result:String) -> Void) -> Todo {
        let myTodo = todos.filter { t in t.id == id }.first
        return myTodo!
//        
//        databaseRef.child("Todos").observe(.childAdded, with:{
//            snapshot in
//            print(snapshot)
//            if (snapshot.key == id)
//            {
//                if let result = snapshot.value as? [String:AnyObject]{
//                    todo.id = snapshot.key
//                    todo.title = result["title"]! as! String
//                    todo.text = result["text"]! as! String
//                    todo.done = NSString(string:result["done"]! as! String).boolValue
//                }
//            }
//            completion("")
//        })
//
//        return todo
    }
}
