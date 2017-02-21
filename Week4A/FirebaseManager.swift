//
//  FirebaseManager.swift
//  TodoApp
//
//  Created by Guilherme Morais on 2017-02-11.
//  Copyright © 2017 Guilherme Morais. All rights reserved.
//  Student #300878610

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

//manages authentication to firebase
class FirebaseManager: NSObject {
    static let database = FIRDatabase.database().reference()
    static var currentUserId:String = ""
    static var currentUser:FIRUser? = nil
    
    //auth user
    static func Login(email:String, password: String, completion: @escaping(_ success:Bool) -> Void)
    {
        FIRAuth.auth()?.signIn(withEmail: email, password: password, completion: { (user, error) in
            if let error = error {
                print(error.localizedDescription)
                completion(false)
            }
            else
            {
                currentUser = user
                currentUserId = (user?.uid)!
                completion(true)
            }
        })
    }
}
