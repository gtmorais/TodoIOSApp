//
//  ViewControllerDetail.swift
//  Week4A
//
//  Created by Guilherme Morais on 2017-01-31.
//  Copyright © 2017 Guilherme Morais. All rights reserved.
//

import UIKit

class ViewControllerDetail: UIViewController {
    @IBOutlet weak var textTitle: UITextField!
    @IBOutlet weak var textText: UITextView!
    @IBOutlet weak var switchDone: UISwitch!
    
    var id:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Alerta()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {

        let todo = TodoManager.getTodo(id: id!) {  (result:String) in
                DispatchQueue.main.async {
                }
        }
                
        textTitle.text = todo.title
    }
    
    @IBAction func save(_ sender: UIBarButtonItem) {
        
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
