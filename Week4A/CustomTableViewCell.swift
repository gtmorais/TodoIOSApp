//
//  CustomTableViewCell.swift
//  Week4A
//
//  Created by Guilherme Morais on 2017-01-31.
//  Copyright © 2017 Guilherme Morais. All rights reserved.
//

import UIKit
import Foundation

class CustomTableViewCell: UITableViewCell {
    @IBOutlet weak var cellTitle: UILabel!
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var cellLabel: UITextView!
    @IBOutlet weak var `switch`: UISwitch!
    
    var delegate:CustomCellDelegate!
    var id : String!
    var done: Bool!
    
    func setDone(done:Bool)
    {
        `switch`.isOn = !done
        if (done) {
            cellLabel.textColor = UIColor.lightGray
            cellTitle.textColor = UIColor.darkGray
        }
    }

    @IBAction func switchChange(_ sender: UISwitch) {
        print("Switched")
        
        if (!sender.isOn) {
            cellTitle.textColor = UIColor.darkGray
            cellLabel.textColor = UIColor.lightGray
        }
        else{
            cellTitle.textColor = UIColor.blue
            cellLabel.textColor = UIColor.black
        }
        
        let todo = TodoManager.getTodo(id: id!) {  (result:String) in
            DispatchQueue.main.async {
            }
        }

        todo.done = !sender.isOn
        TodoManager.updateTodo(todo:todo)
    }
    
    @IBAction func editButton(_ sender: UIButton){
        print("Clicked")
        //let myTodo = Todo()
        if(self.delegate != nil){ //Just to be safe.
            self.delegate.callSegueFromCell(myData: id as String)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
            }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
