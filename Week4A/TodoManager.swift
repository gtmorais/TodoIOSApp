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
    
    static func addTodo(username:String, title:String, text:String){
        let p = Todo(username: username, title: text, text: text)
        if(p.text != ""){
            let uid = FIRAuth.auth()?.currentUser?.uid
            let todo =  ["uid":uid!,
                        "username":p.username,
                        "title":p.title,
                        "text":p.text
            ]
            databaseRef.child("todos").childByAutoId().setValue(todo)
        }
    }
    
    static func fillTodos(uid:String?, toId:String, completion: @escaping(_ result:String) -> Void) {
        todos = []
        let allTodos = databaseRef.child("todos")
        print(allTodos)
        let todo = databaseRef.child("todos").queryOrdered(byChild: "uid").queryEqual(toValue: FirebaseManager.currentUser?.uid).observe(.childAdded, with: {
            snapshot in
            print(snapshot)
        })
        
        databaseRef.child("todos").queryOrdered(byChild: "uid").queryEqual(toValue: FirebaseManager.currentUser?.uid).observe(.childAdded, with:{
            snapshot in
            print(snapshot)
            if let result = snapshot.value as? [String:AnyObject]{
                let toIdCloud = result["toId"]! as! String
                if(toIdCloud == toId){
                    let p = Todo(username: result["username"]! as! String, title: result["title"]! as! String, text: result["text"]! as! String)
                    TodoManager.todos.append(p)
                }
            }
            completion("")
        })
    }
}

class Todo {
    var username:String = ""
    var text: String = ""
    var title:String = ""
    
    init(username:String, title: String, text:String){
        self.username = username
        self.text = text
        self.title = title
    }
}
