//
//  ViewControllerDetail.swift
//  Week4A
//
//  Created by Guilherme Morais on 2017-01-31.
//  Copyright © 2017 Guilherme Morais. All rights reserved.
//

import UIKit

class ViewControllerDetail: UIViewController {
    var todo:Todo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Alerta()
        
    }
    
//        let alert = UIAlertController(title: "Do something", message: "With this", preferredStyle: .actionSheet)
//        alert.addAction(UIAlertAction(title: "A thing", style: .default) { action in
//            action.title
//            // perhaps use action.title here
//        })
//        noteTextView?.contentInset = UIEdgeInsetsMake(-70.0,0.0,0,0.0)
//         Do any additional setup after loading the view.
    
    func Alerta()
    {
        let alertController = UIAlertController(title: "Destructive", message: todo?.title, preferredStyle: UIAlertControllerStyle.alert) //Replace UIAlertControllerStyle.Alert by UIAlertControllerStyle.alert
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
