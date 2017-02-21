//
//  ViewControllerAdd.swift
//  Week4A
//
//  Created by Guilherme Morais on 2017-01-31.
//  Copyright © 2017 Guilherme Morais. All rights reserved.
//  Student #300878610

import UIKit

class ViewControllerAdd: UIViewController {

    @IBOutlet weak var textTitle: UITextField!
    
    @IBOutlet weak var textText: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    //add new todo
    @IBAction func addTodo(_ sender: Any) {
        TodoManager.addTodo(title: textTitle.text!, text: textText.text!)
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "NavigationMain") as! NavigationViewController
        self.present(nextViewController, animated:true, completion:nil)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
