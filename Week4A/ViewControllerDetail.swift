//
//  ViewControllerDetail.swift
//  Week4A
//
//  Created by Guilherme Morais on 2017-01-31.
//  Copyright © 2017 Guilherme Morais. All rights reserved.
//  Student #300878610

import UIKit

//details viewcontroller
class ViewControllerDetail: UIViewController {
    @IBOutlet weak var textTitle: UITextField!
    @IBOutlet weak var textText: UITextView!
    @IBOutlet weak var switchDone: UISwitch!
    var todo = Todo()
    var id:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Alerta()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let mytodo = TodoManager.getTodo(id: id!) {  (result:String) in
                DispatchQueue.main.async {
                }
        }
        todo = mytodo
                
        textTitle.text = todo.title
        textText.text = todo.text
        switchDone.isOn = !todo.done
    }
    
    //save edited todo
    @IBAction func save(_ sender: UIBarButtonItem) {
        todo.text = textText.text
        todo.done = !switchDone.isOn
        todo.title = textTitle.text!
        TodoManager.updateTodo(todo:todo)
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "NavigationMain") as! NavigationViewController
        self.present(nextViewController, animated:true, completion:nil)
    }
    
    func Alerta()
    {
        let alertController = UIAlertController(title: id, message: id, preferredStyle: UIAlertControllerStyle.alert) //Replace UIAlertControllerStyle.Alert by UIAlertControllerStyle.alert
        //    let DestructiveAction = UIAlertAction(title: "Destructive", style: UIAlertActionStyle.destructive) {
        //        (result : UIAlertAction) -> Void in
        //        print("Destructive")
        //    }
    
        // Replace UIAlertActionStyle.Default by UIAlertActionStyle.default
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) {
            (result : UIAlertAction) -> Void in
            print("OK")
        }
    
        //alertController.addAction(DestructiveAction)
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)

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
