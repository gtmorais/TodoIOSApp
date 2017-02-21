//
//  Todo.swift
//  TodoApp
//
//  Created by Guilherme Morais on 2017-02-19.
//  Copyright © 2017 Guilherme Morais. All rights reserved.
//  Student #300878610

import Foundation

//model class
class Todo {
    var id:String = ""
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
    
    init(id: String, title: String, text:String, done:Bool){
        self.id = id
        self.text = text
        self.title = title
        self.done = done
    }
}
